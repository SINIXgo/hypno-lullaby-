holdTimer = -1.0;
singDuration = 4;
specialAnim = false;

characterAnimationsList = {};

characterAnimationsList[0] = 'idle' -- idle
characterAnimationsList[1] = 'singLEFT' -- left
characterAnimationsList[2] = 'singDOWN' -- down
characterAnimationsList[3] = 'singUP' -- up
characterAnimationsList[4] = 'singRIGHT' -- right

player3 = 'missingnobf'
directions = {'left', 'down', 'up', 'right'}

function onCreate() -- change this part for your character image (and the animation prefixes too) (you're also gonna need to make your own offset values)
	--- Caching the character into the memory ---
	makeAnimatedLuaSprite(player3, 'characters/buried/ba_missingno_assets', -150, 600);
    
	makeAnimatedLuaSprite('pokeball','characters/buried/missingnopokeball_assets',-620,460)
	addAnimationByPrefix('pokeball','throw','Ball_Throw',24,false)
	addAnimationByPrefix('pokeball','idle','Ball_Idle_Normal',24,true)
	addAnimationByPrefix('pokeball','idlebreak1','Ball_Idle_Break01',24,true)
	addAnimationByPrefix('pokeball','idlebreak2','Ball_Idle_Break02',24,true)
	addAnimationByPrefix('pokeball','burst','Ball_FinalBurst',24,false)
	addAnimationByPrefix('pokeball','break1','Ball_Break01',24,true)
	addAnimationByPrefix('pokeball','break2','Ball_Break02',24,true)

    scaleObject('pokeball',6,6)
	setProperty('pokeball.antialiasing',false)
	addLuaSprite('pokeball')
	setProperty('pokeball.alpha',0)

    --playAnim('pokeball','break1',true)

	--- Setting up Character Animations ---
	addAnimationByPrefix(player3, 'idle', 'BA_Missingno_Idle', 24, false);
	addOffset(player3, 'idle', -0, -0)

	addAnimationByIndices(player3, 'singLEFT', 'BA_Missingno_Left',"0,1,2,3,4,5", 24);
	addOffset(player3, 'singLEFT', -0, -0)

	addAnimationByIndices(player3, 'singDOWN', 'BA_Missingno_Down',"0,1,2,3,4,5", 24);
	addOffset(player3, 'singDOWN', -0, -0)

	addAnimationByIndices(player3, 'singUP', 'BA_Missingno_Up',"0,1,2,3,4,5", 24);
	addOffset(player3, 'singUP', -0, -0)

	addAnimationByIndices(player3, 'singRIGHT', 'BA_Missingno_Right',"0,1,2,3,4,5", 24);
	addOffset(player3, 'singRIGHT', -0, -0)

   playAnim(player3,'idle',true)
end
function onStepHit()
	if curStep == 1592 then
		setProperty('pokeball.alpha',1)
		playAnim('pokeball','throw',true)
	end
	if curStep == 1602 then
		playAnim('pokeball','idlebreak1',true)
	end
	if curStep == 1624 then
		playAnim('pokeball','break1',true)
	end
	if curStep == 1628 then
		playAnim('pokeball','idlebreak1',true)
	end
	if curStep == 1668 then
		playAnim('pokeball','break2',true)
	end
	if curStep == 1670 then
		playAnim('pokeball','idlebreak2',true)
	end
	if curStep == 1706 then
		playAnim('pokeball','burst',true)
	end
	if curStep == 1727 then
		setProperty('missingnobf.alpha',1)
	end
end
function onCreatePost()
	setProperty(player3..'.flipX', false) -- remove this for other characters, this flips their x position
	addLuaSprite(player3, true);
	setProperty(player3..'.alpha',0)
	setProperty(player3..'.antialiasing',false)
	scaleObject(player3,6,6)
end
local allowbop = false
function onBeatHit()
	if curBeat % 2 == 0 and holdTimer < 0 and not (getProperty(player3..".animation.curAnim.name"):sub(1,4) == 'sing') then
		characterPlayAnimation(0, false)
	end
end

function onCountdownTick(count)
	if count % 2 == 0 then
		characterPlayAnimation(0, false)
	end
end
function goodNoteHit(id, noteData, noteType, isSustainNote)
	if noteType == 'missingno' then
		characterPlayAnimation(noteData + 1, true)
	end
end
function characterPlayAnimation(animId, forced) -- thank you shadowmario :imp:
	-- 0 = idle
	-- 1 = left
	-- 2 = down
	-- 3 = up
	-- 4 = right

	specialAnim = false;

	local animName = characterAnimationsList[animId]
	playAnim(player3, animName, forced); -- this part is easily broke if you use objectPlayAnim (I have no idea why its like this)

	if animId > 0 then 
		specialAnim = true ;
		holdTimer = 0;
	end
end
function onUpdate(elapsed)
	holdCap = stepCrochet * 0.0011 * singDuration;
	if holdTimer >= 0 then
		holdTimer = holdTimer + elapsed;
		if holdTimer >= holdCap and getProperty(player3..".animation.curAnim.name"):sub(1,4) == 'sing' then
			characterPlayAnimation(0, false)
			holdTimer = -1;
		end
	end
    if getProperty('pokeball.animation.curAnim.name') == 'burst' then
		if getProperty('pokeball.animation.curAnim.finished') then
			setProperty('pokeball.alpha',0)
		end
	end
	if getProperty(player3..".animation.curAnim.finished") and specialAnim then
		specialAnim = false;
	end
end