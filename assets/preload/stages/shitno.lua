
function onCreate()

    setProperty('skipCountdown', true)

	makeLuaSprite('thefloor', 'stages/shitno/images/floor', -650, 320)
	setScrollFactor('thefloor', 0.95, 0.95)
	scaleObject('thefloor', 0.8, 0.8);
    setProperty('thefloor.antialiasing',false)
	
	addLuaSprite('thefloor');
	setProperty('thefloor.alpha',0)
end

function onCreatePost()
	for i = 0,3 do
        setPropertyFromGroup('strumLineNotes', i, 'x', 9999 + (112 * (i % 4)))
    end
	setProperty('camGame.alpha',0)
    setProperty('camHUD.alpha',0)
	setProperty('dad.alpha',0)
	setProperty('iconP2.alpha',0)

	setProperty('scoreBar.alpha',0.6)
	setProperty('healthBar.alpha',0.6)
	setProperty('healthBarBG.alpha',0.6)

	setProperty('gf.visible',false)
	setHealthBarColors("000000", "A1A1A1") 
end
function onUpdatePost()
	if curStep >= 0 and curStep <= 408 then
		if getProperty('health') < 0.8 then
			setProperty('health',1)
		end
	end
end
function onStepHit()
	if curStep == 16 then
		for i = 4,7 do
			setPropertyFromGroup('strumLineNotes', i, 'x', 415 + (112 * (i % 4)))
		end
		doTweenAlpha('introlol','camGame',1,2.5,'quadInOut')
	end
	if curStep == 104 then
		doTweenAlpha('hihud','camHUD',1,2,'quadInOut')
	end
	if curStep == 400 then
		--doTweenAlpha('hihud','camHUD',0,1,'quadInOut')
	end
	if curStep == 416 then
		setHealthBarColors("EFAD09", "A1A1A1") 
		doTweenAlpha('thefloor','thefloor',1,2,'quadInOut')
		doTweenAlpha('hidad','dad',1,2,'quadInOut')
		doTweenAlpha('hidade','iconP2',1,2,'quadInOut')
	end
	if curStep == 424 then
		for i = 4,7 do
		noteTweenX('oklmao'..i,i,defaultPlayerStrumX0+ (112 * (i % 4)),1.2,'quadInOut')
		end
		doTweenX('movebf','boyfriend',300,1.2,'quadInOut')
	end
	if curStep == 440 then
		doTweenAlpha('hihud','camHUD',1,1,'quadInOut')
	end

	if curStep == 2904 then
		doTweenAlpha('hihud','camHUD',0,1,'quadInOut')
	end
	if curStep == 2920 then
		setProperty('camGame.alpha',0)
	end
end

