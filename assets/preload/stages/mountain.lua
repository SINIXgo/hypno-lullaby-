
function onCreate()
makeLuaSprite('bg ref', 'stages/mountain/images/bg', -800, -300);
addLuaSprite('bg ref', false);
scaleObject('bg ref', 1, 1)  
setScrollFactor('bg ref',0.6,0.6)

makeLuaSprite('Pokemons', 'stages/mountain/images/Pokemons', 300 , 200);
scaleObject('Pokemons', 0.25, 0.25)  
addLuaSprite('Pokemons', false);
setScrollFactor('Pokemons',0.9,0.9)

makeLuaSprite('Blastoise', 'stages/mountain/images/Blastoise', -400, 100);
scaleObject('Blastoise', 0.4, 0.4)  
addLuaSprite('Blastoise', false);
setScrollFactor('bg',0.8,0.8)

makeLuaSprite('Charizard', 'stages/mountain/images/Charizard', -50 ,-50);
scaleObject('Charizard', 0.5, 0.5)  
addLuaSprite('Charizard', true);
setScrollFactor('Charizard',0.7,0.7)

makeAnimatedLuaSprite('freakachu_entrance','characters/red/freakachu_entrance',562,339)
addAnimationByPrefix('freakachu_entrance','summon','Freakachu entrance instance 1',24,false)
addAnimationByPrefix('freakachu_entrance','fake','Freakachu entrance instance 1',24,false)

scaleObject('freakachu_entrance',0.76,0.76)
addLuaSprite('freakachu_entrance')

makeAnimatedLuaSprite('freakachu','characters/red/Freakachu',622,555)
addAnimationByPrefix('freakachu','pain split','Freakachu PAIN SPLIT',24,false)
addOffset('freakachu','pain split',20,20)
addAnimationByPrefix('freakachu','idle','Freakachu IDLE',24,false)
scaleObject('freakachu',1.18,1.18)
addLuaSprite('freakachu')
playAnim('freakachu','idle',true)
playAnim('freakachu_entrance','fake',true)


setProperty('freakachu.visible',false)
setProperty('freakachu_entrance.visible',false)
setProperty('skipCountdown',true)

end 

function onCreatePost()
    setProperty('camHUD.alpha',0)
	makeLuaSprite('uhfog', 'stages/mountain/images/bg', -0, -0);
addLuaSprite('uhfog', true);
screenCenter('uhfog','xy')
scaleObject('uhfog', 1, 1)  
setScrollFactor('uhfog',0,0)


    makeLuaSprite('fog','stages/mountain/images/fog',0,0)
setObjectCamera('fog','hud')
addLuaSprite('fog',false)
setProperty('fog.alpha',0.25)
    setProperty('gf.visible',false)

    theY = getProperty('iconP2.y')

	setProperty('scoreBar.alpha',0.7)
	setProperty('healthBarBG.alpha',0.7)
	setProperty('healthBar.alpha',0.7)
	for i = 0,7 do
	setPropertyFromGroup('strumLineNotes',i,'alpha',0.7)
	end

	setPropertyFromGroup('strumLineNotes',0,'x',defaultPlayerStrumX0)
	setPropertyFromGroup('strumLineNotes',1,'x',defaultPlayerStrumX1)
	setPropertyFromGroup('strumLineNotes',2,'x',defaultPlayerStrumX2)
	setPropertyFromGroup('strumLineNotes',3,'x',defaultPlayerStrumX3)

	setPropertyFromGroup('strumLineNotes',4,'x',defaultOpponentStrumX0)
	setPropertyFromGroup('strumLineNotes',5,'x',defaultOpponentStrumX1)
	setPropertyFromGroup('strumLineNotes',6,'x',defaultOpponentStrumX2)
	setPropertyFromGroup('strumLineNotes',7,'x',defaultOpponentStrumX3)
end
shakyicon = 0
function onUpdatePost(elapsed)
	P1Mult = getProperty('healthBar.x') + ((getProperty('healthBar.width') * getProperty('healthBar.percent') * 0.01) + (150 * getProperty('iconP1.scale.x') - 150) / 2 - 26)
	P2Mult = getProperty('healthBar.x') + ((getProperty('healthBar.width') * getProperty('healthBar.percent') * 0.01) - (150 * getProperty('iconP2.scale.x')) / 2 - 26 * 2)
	setProperty('iconP1.x',P1Mult - 110)
	setProperty('iconP1.origin.x',240)
	setProperty('iconP1.flipX',true)
	setProperty('iconP2.x',P2Mult + 110)	
	setProperty('iconP2.origin.x',-100)
	setProperty('healthBar.flipX',true)
	woom = (getSongPosition()/100)

	if getProperty('freakachu.animation.curAnim.name') == 'pain split' then
		if getProperty('freakachu.animation.curAnim.finished') then
			playAnim('freakachu','idle',true)
		end
	end
	if getProperty('freakachu_entrance.animation.curAnim.name') == 'summon' then
		if getProperty('freakachu_entrance.animation.curAnim.finished') then
			setProperty('dad.visible',true)
			setProperty('freakachu_entrance.visible',false)
			setProperty('freakachu.visible',true)
		end
	end

    if getProperty('healthBar.percent') < 20 then
        shakyicon = 0.5
	else
		shakyicon = 0.1
	end
	setProperty('iconP1.angle',shakyicon *math.sin(woom))
	setProperty('iconP2.angle',0.15 *math.sin(woom))

end

function onBeatHit()
	if curBeat % 2 == 0 and getProperty('freakachu.animation.curAnim.name') == 'idle' then
		playAnim('freakachu','idle',true)
	end
end

function onStepHit()
	if curStep == 8 then
		playAnim('freakachu','pain split',true)
		doTweenAlpha('uhfoggone','uhfog',0,4,'sineInOut')
	end
	if curStep == 36 then
		playAnim('typhlosion','attack',true)
	end
	if curStep == 56 then
		doTweenAlpha('hellohud','camHUD',1,4,'circOut')
	end
	if curStep == 688 then
		doTweenAlpha('begonehud','camHUD',0,0.5,'circOut')
		playAnim('freakachu_entrance','summon',true)
		setProperty('dad.visible',false)
		setProperty('freakachu_entrance.visible',true)
	end
	if curStep == 704 then
		doTweenAlpha('begonehud','camHUD',1,0.8,'circOut')
	end
	if curStep == 1373 then
		runHaxeCode([[        game.camOther.setFilters([new ShaderFilter(game.getLuaObject("grapshad").shader)]);
		]])
		setProperty('camHUD.visible',false)
		setProperty('camGame.visible',false)
        playSound('Frostbite_ending',1,'ending')
		runTimer('jumpscared',10)
	end
end
local cool = false
function onUpdate()
    if cool then
            endSong()
    end
end


function onEndSong()
    if not isStoryMode then
        if not cool then
            makeLuaSprite('end', 'ending1', 0, 0);
            setObjectCamera('end', 'camOther');
            addLuaSprite('end', true);
            return Function_Stop;
        end
        return Function_Continue;
    end
end

function onSoundFinished(t)
	if t == 'ending' then
		cool = true
	    endSong()
    end
end
function onEvent(n,v1,v2)
	if n == 'freakachu pain split' then
		playAnim('freakachu','pain split',true)
		runTimer('ouch',0.35)
	end
end

function onTimerCompleted(t)
	if t == 'ouch' then
		playSound("Frostbite_bite",0.8)
		setProperty('health',getProperty('health')-0.3)
	end
	if t == 'jumpscared' then
		makeLuaSprite('pk', 'jumpscares/Pikachu', 0, 0);
		scaleObject('pk', 0.35, 0.35)  
		screenCenter('pk','xy')
		addLuaSprite('pk', true);
		cameraShake("other", 0.008, 3.08)
		setObjectCamera('pk', 'other');
	end
end	