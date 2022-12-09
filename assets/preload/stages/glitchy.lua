
function onCreate()

	makeLuaSprite('background', 'stages/glitchy/images/glitch_City', -1320, -725)
	setScrollFactor('background', 0.8, 0.8)
	scaleObject('background', 1 * 0.625, 1 * 0.625);
	addLuaSprite('background',false);

	makeLuaSprite('tiles', 'stages/glitchy/images/tiles', -1400, -725)
	setScrollFactor('tiles', 0.9, 0.9)
	scaleObject('tiles', 1 * 0.625, 1 * 0.625);
	addLuaSprite('tiles');

	makeLuaSprite('haze', 'stages/glitchy/images/haze', -1400, -725)
	setScrollFactor('haze', 0.9, 0.9)
	scaleObject('haze', 1 * 0.625, 1 * 0.625);
	addLuaSprite('haze');

	makeAnimatedLuaSprite('legacyCutscene', 'stages/glitchy/images/they_took_everything_from_me', 600, -22)
	addAnimationByPrefix('legacyCutscene', 'mylegacy', 'GlitchySpeak', 24, false)
	scaleObject('legacyCutscene', 1.2, 1.2)
	setProperty('legacyCutscene.alpha', 0)
	setObjectCamera('legacyCutscene','other')
	addLuaSprite('legacyCutscene');

	makeAnimatedLuaSprite('girlTits', 'stages/glitchy/images/FUCKKKKK', -200, 140)
    addAnimationByPrefix('girlTits', 'idle', 'Lmao', 24, false);
	addLuaSprite('girlTits');

	setProperty('skipCountdown', true)

end

function onCreatePost()
   setProperty('camHUD.alpha',0)
   setProperty('gf.visible',false)
end

function onBeatHit()
	if curBeat % 1 == 0 then
	playAnim('girlTits', 'idle', true);
	end
end