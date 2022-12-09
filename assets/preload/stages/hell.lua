-- stage base by Carlツ on YT
-- edited version by Laztrix
-- https://www.youtube.com/channel/UCcwMlW2ISmZ_v6x9LolOR6Q -- carl channel
-- thanks man -laztrix

function onCreate()
	-- background stuff
	makeLuaSprite('floor', 'stages/hell/images/floor', -210, 560);
	setScrollFactor('', 1.0, 1.0);
	scaleObject('', 0.9, 1.0);
	
	makeLuaSprite('wall', 'stages/hell/images/wall', -206, -68);
	setScrollFactor('', 1.0, 1.0);
	scaleObject('', 0.9, 0.9);
	
	makeLuaSprite('roof', 'stages/hell/images/roof', -195, -68);
	setScrollFactor('', 1.0, 1.0);
	scaleObject('', 1.0, 1.0);
	
	makeLuaSprite('rocks', 'stages/hell/images/rocks', -146, 696);
	setScrollFactor('', 1.0, 1.0);
	scaleObject('rocks', 1.0, 0.9);

	makeLuaSprite('floorbot', 'stages/hell/images/floorbot', 504, 696);
	setScrollFactor('', 1.0, 1.0);
	scaleObject('', 1.0, 1.0);

	makeLuaSprite('pilfor', 'stages/hell/images/pilfor', 1199, 780);
	setScrollFactor('', 1.0, 1.0);
	scaleObject('', 0.9, 1.0);
	
	makeLuaSprite('pil', 'stages/hell/images/pil', 349, 310);
	setScrollFactor('', 1.0, 1.0);
	scaleObject('', 1.0, 1.0);
	

	makeAnimatedLuaSprite('HellBell','stages/hell/images/HellBell',620,282)
	scaleObject('HellBell', 0.45, 0.45)
	addAnimationByPrefix('HellBell','dance','BellIdle',24,true)
	addOffset('HellBell','dance',240,170)
	addAnimationByPrefix('HellBell','bellin','BongLmao',24,false)
	addOffset('HellBell','bellin',220,170)

	makeAnimatedLuaSprite('glowleft','stages/hell/images/glowleft',-422,448)
	scaleObject('glowleft', 0.5, 0.5)
	addAnimationByPrefix('glowleft','dance','glowleft',24,true)
	makeAnimatedLuaSprite('glowright','stages/hell/images/glowright',1000,438)
	scaleObject('glowright', 0.5, 0.5)
	addAnimationByPrefix('glowright','dance','glowright',24,true)
	makeAnimatedLuaSprite('lavabottom','stages/hell/images/lavabottom',-220,650)
	scaleObject('lavabottom', 0.5, 0.5)
	makeAnimatedLuaSprite('lavatop','stages/hell/images/lavatop',-224,648)
	addAnimationByPrefix('lavabottom','dance','lavabottom',24,true)
	addAnimationByPrefix('lavatop','dance','lavatop',24,true)
	scaleObject('lavatop', 0.5, 0.5)
	objectPlayAnimation('Normal instance','dance',true)
	objectPlayAnimation('dd instance','dance',true)
	setScrollFactor('sans', 0.9, 0.9);

	addLuaSprite('wall', false);
	addLuaSprite('', false);
	addLuaSprite('lavabottom', false);
	addLuaSprite('floorbot', false);
	addLuaSprite('rocks', false);
	addLuaSprite('lavatop', false);
	addLuaSprite('glowleft', false);
	addLuaSprite('glowright', false);
	addLuaSprite('roof', false);
	addLuaSprite('floor', false);
	addLuaSprite('HellBell', false);
	addLuaSprite('pilfor', false);
	addLuaSprite('pil', false);
	


end
local nointro = false
function onCreatePost()
	setProperty('gf.alpha',0)
	if not nointro then
	setProperty('camGame.visible',false)
	setProperty('camHUD.visible',false)
	end
end
function onBeatHit()
	if curBeat == 323 then
		
	doTweenY('lavabottom','lavabottom',660,1.5,'expoOut')
	doTweenY('lavatop','lavatop',658,1.5,'expoOut')
	doTweenY('glowleft','glowleft',458,1.5,'expoOut')
	doTweenY('glowright','glowright',448,1.5,'expoOut')
	
	makeAnimatedLuaSprite('ContractBF','characters/beelze/ContractBF', 975, 490)
	scaleObject('ContractBF', 0.62, 0.62)
	getObjectOrder('ContractBF')
	setObjectOrder('dadGroup', 10)
	setObjectOrder('ContractBF', 11)
	setObjectCamera('ContractBF', 'game')
	for i = 1,9 do
	addAnimationByPrefix('ContractBF','a'..i,'Contract_BF_0'..i,24,false)
	end
	addAnimationByPrefix('ContractBF','idle','ContractIdle',24,false)
playAnim('ContractBF','idle',true)
	addLuaSprite('ContractBF', false);
end
if curBeat == 448 then
	doTweenColor('contract','ContractBF',"ff0000",1,'circOut')
	doTweenX('contractx','ContractBF.scale',0,2,'circOut')
	doTweenY('contracty','ContractBF.scale',0,2,'circOut')
end
if curBeat == 582 then
	doTweenAlpha('camh','camHUD',0,2,'circOut')
end
if curBeat == 584 then
	doTweenZoom('camOther','camOther',0.84,3,'sineOut')
	doTweenZoom('camgame','camGame',0.6,3,'sineOut')
end
if curBeat == 597 then
	doTweenAlpha('camGame','camGame',0,0.7,'circOut')
    playSound('bimbembooff',0.5)
end
if curBeat == 600 then
	doTweenAlpha('dsbf','dsbf',0.6,3,'circOut')
end
end

local allowCountdown = false
local stops = 0;


function onStartCountdown()
	-- Block the first countdown and start a timer of 0.8 seconds to play the dialogue
	if not allowCountdown and not isStoryMode and not seenCutscene and not nointro then
		setProperty('camOther.zoom',0.836)
		setProperty('camHUD.zoom',0.5)
		setProperty('camGame.zoom',0.6)
		setProperty('inCutscene', true);
		
		if stops == 0 then
			makeLuaSprite('ds','UI/base/hellbell/ds_01',-220,-120)
			addLuaSprite('ds')
			scaleObject('ds',0.9,0.9)
			setObjectCamera('ds','other')
			runTimer('activeds',1)
			setProperty('skipCountdown',true)

		end
		if stops == 1 then
		
		setProperty('camHUD.alpha',1)
		runTimer('startDialogue', 0.2);
		
		end
		stops = stops + 1
		return Function_Stop;
	end
	return Function_Continue;
end
function onTweenCompleted(t)
	if t == 'lavabottom' then
		
	doTweenY('lavabottom1','lavabottom',650,1.5,'linear')
	doTweenY('lavatop1','lavatop',648,1.5,'linear')
	doTweenY('glowleft1','glowleft',448,1.5,'linear')
	doTweenY('glowright1','glowright',438,1.5,'linear')

	end
    if t == 'lavabottom1' then
		doTweenY('lavabottom','lavabottom',660,1.5,'linear')
		doTweenY('lavatop','lavatop',658,1.5,'linear')
		doTweenY('glowleft','glowleft',458,1.5,'linear')
		doTweenY('glowright','glowright',448,1.5,'linear')
	end
	if t == 'ds1' then
		removeLuaSprite('bimbembo',false)
		removeLuaSprite('dsgra',false)
	end
end
function onTimerCompleted(t)
	if t == 'activeds' then
		makeLuaSprite('dsgra','UI/base/hellbell/dsgradient',129.5,80)
		addLuaSprite('dsgra')
		scaleObject('dsgra',0.79,0.797)
		setObjectCamera('dsgra','other')
		runTimer('introds',0.1)
		makeLuaSprite('dsbf','UI/base/hellbell/ds_03',-190,-100)
		addLuaSprite('dsbf')
		scaleObject('dsbf',0.87,0.87)
		setObjectCamera('dsbf','other')
		setProperty('dsbf.alpha',0)
	end
	if t == 'introds' then
		
		makeAnimatedLuaSprite('bimbembo',"UI/base/hellbell/bimbembo",270,100)
        addAnimationByPrefix('bimbembo','intro','dsintro',24,false)
		addLuaSprite('bimbembo')
		setObjectCamera('bimbembo','other')
scaleObject('bimbembo',0.8,0.8)
		playSound('bimbembo',0.5)
		runTimer('startplay',3)
		setProperty('camGame.visible',true)
	setProperty('camHUD.visible',true)
	end
	if t == 'startplay' then
		runTimer('playsong',1)
doTweenAlpha('ds1','dsgra',0,1.5,'circOut')
doTweenAlpha('ds2','bimbembo',0,1.5,'circOut')
	
	end
	if t == 'playsong' then
		allowCountdown = true;
		setProperty('inCutscene', false);
		startDialogue('dialogue');
		startCountdown();
	end
end
function onSongStart()
	doTweenZoom('goin','camOther',1.5,3,'elasticInOut')
	doTweenZoom('goina','camHUD',1,3,'elasticInOut')
	for i = 0,3 do
		setPropertyFromGroup('strumLineNotes',i,'x',9999)
	end
	if not middlescroll then
	setPropertyFromGroup('playerStrums', 0, 'x', defaultOpponentStrumX0)
	setPropertyFromGroup('playerStrums', 1, 'x', defaultOpponentStrumX1)
	setPropertyFromGroup('playerStrums', 2, 'x', defaultOpponentStrumX2+280)
	setPropertyFromGroup('playerStrums', 3, 'x', defaultOpponentStrumX3+280)
	else
	setPropertyFromGroup('playerStrums', 0, 'x', defaultPlayerStrumX0-180)
	setPropertyFromGroup('playerStrums', 1, 'x', defaultPlayerStrumX1-180)
	setPropertyFromGroup('playerStrums', 2, 'x', defaultPlayerStrumX2+180)
	setPropertyFromGroup('playerStrums', 3, 'x', defaultPlayerStrumX3+180)
	end
end
