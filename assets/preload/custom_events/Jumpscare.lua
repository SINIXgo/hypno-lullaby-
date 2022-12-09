function onCreate()

end

function onEvent(name, value1, value2)
	if name == "Jumpscare" then
		makeLuaSprite('jumpscare', 'jumpscares/'..value1, 0, 0);
		if value1 == "Gold" then
			scaleObject('jumpscare', 0.35, 0.35)
		elseif value1 == "GoldAlt" then
			scaleObject('jumpscare', 0.3, 0.32)
		end
		screenCenter('jumpscare', 'x')
		screenCenter('jumpscare', 'y')
		addLuaSprite('jumpscare', true);
		setObjectCamera('jumpscare', 'other');
		setObjectOrder('jumpscare', 1)
		runTimer('okbye', ((stepCrochet * (value2 * (1 / 2))) / 1000)-0.1);
		cameraShake('other', 0.0125, ((stepCrochet * (value2 * (1 / 2))) / 1000))
	end
end

function onTimerCompleted(tag)
	if tag == 'okbye' then
		doTweenAlpha('byejumpscare', 'jumpscare', 0, 0.1)
	end
end

function onTweenCompleted(tag)
	if tag == 'byejumpscare' then
		removeLuaSprite('jumpscare')
	end
end