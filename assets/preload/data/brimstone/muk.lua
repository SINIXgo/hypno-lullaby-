holdTimer = -1.0;
singDuration = 4;
specialAnim = false;

characterAnimationsList = {};

characterAnimationsList[0] = 'idle' -- idle
characterAnimationsList[1] = 'singLEFT' -- left
characterAnimationsList[2] = 'singDOWN' -- down
characterAnimationsList[3] = 'singUP' -- up
characterAnimationsList[4] = 'singRIGHT' -- right
characterAnimationsList[5] = 'eww'
player3 = 'muk'
directions = {'left', 'down', 'up', 'right'}

function onCreate() -- change this part for your character image (and the animation prefixes too) (you're also gonna need to make your own offset values)
	--- Caching the character into the memory ---
	makeAnimatedLuaSprite(player3, 'characters/buried/leanmonster', 650, 530);

	--- Setting up Character Animations ---
	addAnimationByPrefix(player3, 'idle', 'Muk_Idle', 24, false);
	addOffset(player3, 'idle', -0, -0)

	addAnimationByPrefix(player3, 'singLEFT', 'Muk_Left', 24, false);
	addOffset(player3, 'singLEFT', -0, -0)

	addAnimationByPrefix(player3, 'singDOWN', 'Muk_Down', 24, false);
	addOffset(player3, 'singDOWN', -0, -0)

	addAnimationByPrefix(player3, 'singUP', 'Muk_Up', 24, false);
	addOffset(player3, 'singUP', -0, -0)

	addAnimationByPrefix(player3, 'singRIGHT', 'Muk_Right', 24, false);
	addOffset(player3, 'singRIGHT', -0, -0)

	addAnimationByPrefix(player3, 'wop', 'Muk_Intro', 24, false);
	addOffset(player3, 'wop', -0, -0)
	
	addAnimationByPrefix(player3, 'eww', 'Muk_Puke', 24, false);
	addOffset(player3, 'eww', -0, -0)

	playAnim(player3,'singLEFT',true)
end

function onCreatePost()
	setProperty(player3..'.flipX', false) -- remove this for other characters, this flips their x position
	addLuaSprite(player3, true);
	setProperty(player3..'.alpha',0)
	scaleObject(player3,6,6)
	setProperty(player3..'.antialiasing',false)

end
local allowbop = false
function onBeatHit()
	if curBeat % 2 == 0 and holdTimer < 0 and not (getProperty(player3..".animation.curAnim.name"):sub(1,4) == 'sing')  then
		characterPlayAnimation(0, true)
	end
end
function onCountdownTick(count)
	if count % 2 == 0 then
		characterPlayAnimation(0, false)
	end
end
function opponentNoteHit(id, noteData, noteType, isSustainNote)
	if noteType == 'muk' then
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
		if holdTimer >= holdCap and getProperty(player3..".animation.curAnim.name"):sub(1,4) == 'sing' or holdTimer >= holdCap and getProperty('muk.animation.curAnim.name') == 'eww' then
			characterPlayAnimation(0, false)
			holdTimer = -1;
		end
	end
	
	if getProperty(player3..".animation.curAnim.finished") and specialAnim then
		specialAnim = false;
	end
end


function onStepHit()
	if curStep == 2704 then
		setProperty('muk.alpha',1)
		playAnim('muk','wop',true)
	end
end


function onEvent(name,value1,value2)
	if name == 'muk cum' then 
		characterPlayAnimation(5, true)
		runTimer('cumed',0.3)
		end	
	end

	function onTimerCompleted(t)
		if t == 'cumed' then
			makeAnimatedLuaSprite('cum','characters/buried/muksludge',0,-20)
			setProperty('cum.alpha',1)
			for i = 1,3 do
				addAnimationByPrefix('cum','cum'..i,'Sludge_0'..i,24,false)
			end
			setObjectCamera('cum','hud')
			addLuaSprite('cum')
			scaleObject('cum',3.5,3.5)
			setProperty('cum.antialiasing',false) --wtf?? 
			playAnim('cum','cum'..getRandomInt(1,3),true)
			setObjectCamera('cum','other')
			runTimer('cumgone',2)
		end
		if t == 'cumgone' then
			doTweenAlpha('cumgone','cum',0,2,'sineInOut')
	
		end
	end
	