--coded by Laztrix & Nickobelit
local yourtriallife = 10
function onCreate()

    makeAnimatedLuaSprite('typhlosion', 'characters/gold/TYPHLOSION_MECHANIC', -50, 620); 
    addAnimationByIndices('typhlosion', 'idle', 'TYPHLOSION MECHANIC',"0,1,2,3,4,5,6,7,8,9,10,11,12,13", 24);
    addAnimationByIndices('typhlosion', 'attack', 'TYPHLOSION MECHANIC',"14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29", 24); 
    playAnim('typhlosion', 'idle',true); 
    scaleObject('typhlosion', 1.1,1.1);
    addLuaSprite('typhlosion', false);
    
    makeLuaSprite('blueBar','', 56, 195);
    makeGraphic('blueBar',15,350,'305385')
    scaleObject('blueBar', 1,1)
    setProperty('blueBar.alpha',1)
    setObjectCamera("blueBar", 'hud')
    addLuaSprite('blueBar', false);
   
    makeLuaSprite('lightblueBar','', 56, 550);
    makeGraphic('lightblueBar',15,350,'AED4F8')
    scaleObject('lightblueBar', 1,0.1)
    setProperty('lightblueBar.alpha',1)
    setObjectCamera("lightblueBar", 'hud')
    addLuaSprite('lightblueBar', false);

    makeAnimatedLuaSprite('pokemonBar', 'UI/base/TyphlosionVit', 25, 135);
    addAnimationByPrefix('pokemonBar', 'idle1', 'Typh1 instance 1', 24, true);
    addAnimationByPrefix('pokemonBar', 'idle2', 'Typh2 instance 1', 24, true);
    addAnimationByPrefix('pokemonBar', 'idle3', 'Typh3 instance 1', 24, true);
    addAnimationByPrefix('pokemonBar', 'idle4', 'Typh4 instance 1', 24, true);
    addAnimationByPrefix('pokemonBar', 'idle5', 'Typh5 instance 1', 24, true);
    scaleObject('pokemonBar', 1,1);
    addLuaSprite('pokemonBar', true);
    setObjectCamera("pokemonBar", 'hud')
    playAnim('pokemonBar','idle1',true)
     
    makeAnimatedLuaSprite('freezeBar', 'UI/base/Thermometer', 20, 190);
    addAnimationByPrefix('freezeBar', 'idle1', 'Therm1', 24, false);
    addAnimationByPrefix('freezeBar', 'idle2', 'Therm2', 24, false);
    addAnimationByPrefix('freezeBar', 'idle3', 'Therm3', 24, false);
    scaleObject('freezeBar', 1,1);
    addLuaSprite('freezeBar', true);
    setObjectCamera("freezeBar", 'hud')
        
    setObjectOrder('white', 1);
    setObjectOrder('bg', 2);
    setObjectOrder('dadGroup', 3);
    setObjectOrder('gfGroup', 4);
    setObjectOrder('boyfriendGroup', 5);
    setObjectOrder('typhlosion', 6);
    playAnim('freezeBar', 'idle1',true); 

end
local mechanic = true
local canfreeze = true
function onUpdatePost(elapsed)
    if curStep == 1373 then
        mechanic = false
    end
    setProperty('fog.alpha',getProperty('lightblueBar.scale.y') * 1)

    if getProperty('lightblueBar.scale.y') > 0.45 and getProperty('lightblueBar.scale.y') < 0.7 then
        playAnim('freezeBar', 'idle2',true); 
    elseif getProperty('lightblueBar.scale.y') > 0.7 then
        playAnim('freezeBar', 'idle3',true); 
    elseif getProperty('lightblueBar.scale.y') < 0.45 then
        playAnim('freezeBar', 'idle1',true); 
    end

if keyJustPressed('space') and yourtriallife > -1 then 
    if yourtriallife == 8 then
        playAnim('pokemonBar','idle2',true)
    elseif yourtriallife == 5 then
        playAnim('pokemonBar','idle3',true)
    elseif yourtriallife == 3 then
        playAnim('pokemonBar','idle4',true)
    elseif yourtriallife == 1 then
        playAnim('pokemonBar','idle5',true)
    end
    if mechanic then
        canfreeze = false
        yourtriallife = yourtriallife - 1
        playAnim('typhlosion', 'attack',true); 
        runTimer('idle', 1.4)
        playSound('TyphlosionUse', 0.5)
        if getProperty('lightblueBar.y') < 550 then
        doTweenY('lightbluey','lightblueBar',getProperty('lightblueBar.y')+50,1,'expoOut')
        end
        if getProperty('lightblueBar.scale.y') > 0.2 then
        doTweenY('lightblueya','lightblueBar.scale',getProperty('lightblueBar.scale.y')-0.30,1,'expoOut')
        end
    end
--debugPrint("no way its working")
end

if getProperty('typhlosion.animation.curAnim.name') == 'attack' then
    if getProperty('typhlosion.animation.curAnim.finished') then
        playAnim('typhlosion','idle',true)
    end
end
end


function onBeatHit()
    if mechanic then
    if curBeat % 2 == 0 and getProperty('typhlosion.animation.curAnim.name') == 'idle' then
		playAnim('typhlosion','idle',true)
	end
if curBeat % 1 == 0 then
   -- debugPrint(getProperty('lightblueBar.scale.y'))  -- i can see the value shit
    setProperty('health',getProperty('health')- 0.06 * getProperty('lightblueBar.scale.y'))

    if canfreeze then
setProperty('lightblueBar.y',getProperty('lightblueBar.y')-1.8)
setProperty('lightblueBar.scale.y',getProperty('lightblueBar.scale.y')+0.01)
    end
end
end
end

function onTweenCompleted(t)
    if t == 'lightbluey' then
        canfreeze = true
    end
end
