
function onCreate()

	setProperty('camZooming', false)
    setProperty('skipCountdown', true)

	makeAnimatedLuaSprite('background', 'stages/shitty-cave/images/BG_shitno', -0, -0)
	addAnimationByPrefix('background','bg','BG_shitno_01',0,false)
	scaleObject('background', 6, 6);

	makeAnimatedLuaSprite('topbackground', 'stages/shitty-cave/images/BG_shitno', -0, -0)
	addAnimationByPrefix('topbackground','bg','BG_shitno_02',0,false)
	scaleObject('topbackground', 6, 6);

	addLuaSprite('background',false)
	addLuaSprite('topbackground',false)

	setProperty('background.antialiasing',false)
	setProperty('topbackground.antialiasing',false)

	makeAnimatedLuaSprite('pokeball', 'characters/shinto/shitno_pokeball', 1000, 550)
	addAnimationByPrefix('pokeball','draw','shitno_pokeballend',24,false)
	scaleObject('pokeball', 5, 5);

	addLuaSprite('pokeball',true)
	setProperty('pokeball.antialiasing',false)
    setProperty('pokeball.visible',false)
end

function onCreatePost()
	setProperty('boyfriend.visible',false)
	setProperty('gf.visible',false)
end

function onStepHit()
	if curStep == 2072 then
		setProperty('pokeball.visible',true)
		setProperty('dad.specialAnim',true)
		playAnim('pokeball','draw',true)
	end
	if curStep == 2080 then
		--playSound('huh',1) -- funny thing 1
	end
end
local Paused = false
local bro = false
function onUpdatePost()
	if getProperty('dad.animation.curAnim.name') == 'you died' then
       if getProperty('dad.animation.curAnim.finished') then
		   setProperty('dad.visible',false)
		   runTimer('leave',0.12)
	   end
	end
	if Paused == true then
		setPropertyFromClass('Conductor', 'songPosition', getPropertyFromClass('Conductor', 'songPosition')) -- it is counted by milliseconds, 1000 = 1 second
		setPropertyFromClass('flixel.FlxG', 'sound.music.time', getPropertyFromClass('Conductor', 'songPosition'))
		setProperty('vocals.time', getPropertyFromClass('Conductor', 'songPosition'))
		setPropertyFromClass('flixel.FlxG', 'sound.music.volume', 0)
		setProperty('vocals.volume', 0)
		setProperty("boyfriend.animation.curAnim.paused", true)
		setProperty("gf.animation.curAnim.paused", true)
		setProperty("playerStrums.animation.curAnim.paused", true)
		setProperty("boyfriend.heyTimer", 0)
		setProperty("dad.heyTimer", 0)
		setProperty("gf.heyTimer", 0)
	end
    
	if getProperty('health') < 0.01 then
		if not bro then
			removeLuaScript("ECR")
			bro = true
		runTimer('hasdied',0.01)
		end
		setProperty('health',0.01)
		setProperty('camZooming',false)
	end
end

function onTimerCompleted(t)
	if t == 'leave' then
		close()
	end
	if t == 'hasdied' then
		Paused = true
		playSound('ShintoRetry',1.5) 
		--playSound('lmao',1.5)  --funny thing 2
		doTweenAlpha('haha','camHUD',0,1,'expoOut')
		triggerEvent('Play Animation','you died','dad')
	end
end
