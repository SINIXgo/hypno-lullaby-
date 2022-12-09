holdTimer = -1.0;
singDuration = 4;
specialAnim = false;

characterAnimationsList = {};

characterAnimationsList[0] = 'idle' -- idle
characterAnimationsList[1] = 'singLEFT' -- left
characterAnimationsList[2] = 'singDOWN' -- down
characterAnimationsList[3] = 'singUP' -- up
characterAnimationsList[4] = 'singRIGHT' -- right

player3 = 'bagf'
directions = {'left', 'down', 'up', 'right'}

function onCreate() -- change this part for your character image (and the animation prefixes too) (you're also gonna need to make your own offset values)
	--- Caching the character into the memory ---
	makeAnimatedLuaSprite(player3, 'characters/buried/apparitiongf_assets', -60, 300);
	makeAnimatedLuaSprite("wa", 'characters/buried/WA_assets', 100, 50);
	addAnimationByPrefix("wa", 'intro', 'WH_Intro', 24, false);
	addAnimationByPrefix("wa", 'idle', 'WH_Idle', 24, true);
	addAnimationByPrefix("wa", 'morph', 'WH_ToGF', 24, false);

    setProperty('wa.antialiasing',false)
	scaleObject("wa",6,6)
	addLuaSprite("wa")
    playAnim("wa","idle",true)

    makeLuaSprite('shadowgf','characters/buried/shadow',90,0) --200
	scaleObject('shadowgf',6,6)
	addLuaSprite('shadowgf')
	setProperty('shadowgf.antialiasing',false)
	--- Setting up Character Animations ---
	addAnimationByPrefix(player3, 'idle', 'BAGF_Idle', 24, true);
	addOffset(player3, 'idle', -350, -330)

	addAnimationByPrefix(player3, 'singLEFT', 'BAGF_Left', 24, false);
	addOffset(player3, 'singLEFT', -350, -330)

	addAnimationByPrefix(player3, 'singDOWN', 'BAGF_Down', 24, false);
	addOffset(player3, 'singDOWN', -350, -330)

	addAnimationByPrefix(player3, 'singUP', 'BAGF_Up', 24, false);
	addOffset(player3, 'singUP', -350, -330)

	addAnimationByPrefix(player3, 'singRIGHT', 'BAGF_Right', 24, false);
	addOffset(player3, 'singRIGHT',-350, -330)

	playAnim(player3,'idle',true)
end
local isflying = false
function onCreatePost()
	setProperty(player3..'.flipX', false) -- remove this for other characters, this flips their x position
	addLuaSprite(player3, true);
	setProperty(player3..'.alpha',0)
	setProperty('wa.alpha',0)
    setProperty('shadowgf.alpha',0)
	scaleObject(player3,6,6)
	setProperty(player3..'.antialiasing',false)


end
function onTweenCompleted(t)
	if t == 'movehand' then
		isflying = true
	end
end
local whitehand = true

function onStepHit()
	if curStep == 3232 then
		setProperty('wa.alpha',1)
        setProperty('shadowgf.alpha',1)
		playAnim('wa','intro',true)
	end
	if curStep == 3456 then
		whitehand = false
		doTweenY('movehand','wa',170,3,'sineInOut')
		doTweenY('moveshadow','shadowgf',300,2,'sineInOut')
		playAnim('wa','morph',true)
	end
end
local allowbop = false
function onBeatHit()
	if curBeat % 2 == 0 and holdTimer < 0 and not (getProperty(player3..".animation.curAnim.name"):sub(1,4) == 'sing') then
		--characterPlayAnimation(0, true)
	end
end
function onCountdownTick(count)
	if count % 2 == 0 then
		characterPlayAnimation(0, false)
	end
end
function opponentNoteHit(id, noteData, noteType, isSustainNote)
	if noteType == 'bagf' then
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

	songPos = getSongPosition()
local curbeathand = (songPos/3000)*(curBpm/60)
local curbeatgf = (songPos/6000)*(curBpm/60)

if whitehand then
doTweenY('wahand', 'wa', 30 + (math.sin((curbeathand)) * 20), 0.001)
end
if isflying then
doTweenY('waaaa', 'bagf', 30 + (math.sin((curbeatgf)) * 50), 0.001)
doTweenX('waaa', 'bagf', -60 + (math.sin((curbeatgf)+1) * 50), 0.001)
doTweenX('watf', 'shadowgf', 75 + (math.sin((curbeatgf)+1) * 50), 0.001)

end
	holdCap = stepCrochet * 0.0011 * singDuration;
	if holdTimer >= 0 then
		holdTimer = holdTimer + elapsed;
		if holdTimer >= holdCap and getProperty(player3..".animation.curAnim.name"):sub(1,4) == 'sing' then
			characterPlayAnimation(0, false)
			holdTimer = -1;
		end
	end
    if getProperty('wa.animation.curAnim.name') == 'intro' then
		if getProperty('wa.animation.curAnim.finished') then
			playAnim('wa','idle',true)
		end
	end
	if getProperty('wa.animation.curAnim.name') == 'morph' then
		if getProperty('wa.animation.curAnim.finished') then
			setProperty('bagf.alpha',1)
			setProperty('wa.alpha',0)
		end
	end
	if getProperty(player3..".animation.curAnim.finished") and specialAnim then
		specialAnim = false;
	end
end
