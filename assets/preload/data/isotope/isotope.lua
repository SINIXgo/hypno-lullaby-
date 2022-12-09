function onCreatePost()
    for i = 0,3 do
		setPropertyFromGroup('strumLineNotes', i, 'alpha', 0)
	end
	for i = 4,7 do
		setPropertyFromGroup('strumLineNotes', i, 'alpha', 0.75)
	end
	setPropertyFromGroup('playerStrums', 0, 'x', defaultOpponentStrumX0)
	setPropertyFromGroup('playerStrums', 1, 'x', defaultOpponentStrumX1)
	setPropertyFromGroup('playerStrums', 2, 'x', defaultOpponentStrumX2)
	setPropertyFromGroup('playerStrums', 3, 'x', defaultOpponentStrumX3)





    initLuaShader('redAberration')
  
    affection = 30
    angaffection = 10
    shaderName = "vignetteGlitch"
    shaderCoordFix() -- initialize a fix for textureCoord when resizing game window

    makeLuaSprite("tempShader0")
    runHaxeCode([[
        var shaderName = "]] .. shaderName .. [[";
        
        game.initLuaShader(shaderName, 130);
        
        var shader0 = game.createRuntimeShader(shaderName);
        game.camGame.setFilters([new ShaderFilter(shader0)]);
        game.getLuaObject("tempShader0").shader = shader0; // setting it into temporary sprite so luas can set its shader uniforms/properties
        return;
    ]])
end

function funnynote()
    if not middlescroll then
       setPropertyFromGroup('strumLineNotes',4,'x',defaultOpponentStrumX0 + getRandomInt(-affection,affection))
       setPropertyFromGroup('strumLineNotes',5,'x',defaultOpponentStrumX1 + getRandomInt(-affection,affection))
       setPropertyFromGroup('strumLineNotes',6,'x',defaultOpponentStrumX2 + getRandomInt(-affection,affection))
       setPropertyFromGroup('strumLineNotes',7,'x',defaultOpponentStrumX3 + getRandomInt(-affection,affection))

       setPropertyFromGroup('strumLineNotes',4,'y',defaultOpponentStrumY0 + getRandomInt(-affection,affection))
       setPropertyFromGroup('strumLineNotes',5,'y',defaultOpponentStrumY1 + getRandomInt(-affection,affection))
       setPropertyFromGroup('strumLineNotes',6,'y',defaultOpponentStrumY2 + getRandomInt(-affection,affection))
       setPropertyFromGroup('strumLineNotes',7,'y',defaultOpponentStrumY3 + getRandomInt(-affection,affection))
    else
        setPropertyFromGroup('strumLineNotes',4,'x',defaultPlayerStrumX0 + getRandomInt(-affection,affection))
        setPropertyFromGroup('strumLineNotes',5,'x',defaultPlayerStrumX1 + getRandomInt(-affection,affection))
        setPropertyFromGroup('strumLineNotes',6,'x',defaultPlayerStrumX2 + getRandomInt(-affection,affection))
        setPropertyFromGroup('strumLineNotes',7,'x',defaultPlayerStrumX3 + getRandomInt(-affection,affection))
 
        setPropertyFromGroup('strumLineNotes',4,'y',defaultPlayerStrumY0 + getRandomInt(-affection,affection))
        setPropertyFromGroup('strumLineNotes',5,'y',defaultPlayerStrumY1 + getRandomInt(-affection,affection))
        setPropertyFromGroup('strumLineNotes',6,'y',defaultPlayerStrumY2 + getRandomInt(-affection,affection))
        setPropertyFromGroup('strumLineNotes',7,'y',defaultPlayerStrumY3 + getRandomInt(-affection,affection))
    end

       if curStep >= 576 then
        for i = 4,7 do
            setPropertyFromGroup('strumLineNotes',i,'angle',getRandomInt(-angaffection,angaffection))
        end
        end
       runTimer('goback',0.1)
end
function onTimerCompleted(t)
    if t == 'goback' then
        if not middlescroll then
            noteTweenX('ha',4,defaultOpponentStrumX0,0.5,'expoOut')
            noteTweenX('ha2',5,defaultOpponentStrumX1,0.5,'expoOut')
            noteTweenX('ha3',6,defaultOpponentStrumX2,0.5,'expoOut')
            noteTweenX('ha4',7,defaultOpponentStrumX3,0.5,'expoOut')

            noteTweenY('haa',4,defaultOpponentStrumY0,0.5,'expoOut')
            noteTweenY('haa2',5,defaultOpponentStrumY1,0.5,'expoOut')
            noteTweenY('haa3',6,defaultOpponentStrumY2,0.5,'expoOut')
            noteTweenY('haa4',7,defaultOpponentStrumY3,0.5,'expoOut')
        else
            noteTweenX('ha',4,defaultPlayerStrumX0,0.5,'expoOut')
            noteTweenX('ha2',5,defaultPlayerStrumX1,0.5,'expoOut')
            noteTweenX('ha3',6,defaultPlayerStrumX2,0.5,'expoOut')
            noteTweenX('ha4',7,defaultPlayerStrumX3,0.5,'expoOut')

            noteTweenY('haa',4,defaultPlayerStrumY0,0.5,'expoOut')
            noteTweenY('haa2',5,defaultPlayerStrumY1,0.5,'expoOut')
            noteTweenY('haa3',6,defaultPlayerStrumY2,0.5,'expoOut')
            noteTweenY('haa4',7,defaultPlayerStrumY3,0.5,'expoOut')
        end
            if curStep >= 576 then
                for i = 4,7 do
                    noteTweenAngle('anglenote'..i,i,0,0.5,'expoOut')
                end
            end
    end
end
local songrandom = {"1S0T0P3",'is0top3','IsOt0pe',"1s0tope","Is0t0pe","isOTOPE"}
function onStepHit()
    if curStep == 1104  then 
        setSpriteShader('dad', 'redAberration')
        setSpriteShader('background', 'redAberration')
        affection = 70
        angaffection = 60
    end
    if curStep == 2000 then
        setSpriteShader('tiles', 'redAberration')
    end
    if curStep % 2 == 0 then
   setTextString('centerMark', ' - ' .. songrandom[getRandomInt(1,5)] .. ' [' .. string.upper(difficultyName) .. "] -")
    end
end
local aberinten = 0
local aberinit = 0
function onUpdate()
    if curStep >= 1104 then
        if aberinit > 0 then
            aberinit = aberinit - 0.01
         end
         if aberinten > 0 then
             aberinten = aberinten - 0.01
         end
    setShaderFloat('tempShader0', 'time', os.clock() * 0.6)
    setShaderFloat('tempShader0', 'prob', 0.9)
    setShaderFloat('tempShader0', 'intensity', 0.8)
    setShaderFloat('dad', 'intensity', aberinten)
    setShaderFloat('dad', 'initial', aberinit)
    end
end
function onBeatHit()
   if curBeat % 2 == 0 then
    funnynote()
   end
    if curBeat % 4 == 0 then --1104
        aberinten = 2
        aberinit = 0.5
       
    end
end

function shaderCoordFix()
    runHaxeCode([[
        resetCamCache = function(?spr) {
            if (spr == null || spr.filters == null) return;
            spr.__cacheBitmap = null;
            spr.__cacheBitmapData = null;
        }
        
        fixShaderCoordFix = function(?_) {
            resetCamCache(game.camGame.flashSprite);
            resetCamCache(game.camHUD.flashSprite);
            resetCamCache(game.camOther.flashSprite);
        }
    
        FlxG.signals.gameResized.add(fixShaderCoordFix);
        fixShaderCoordFix();
        return;
    ]])
    
    local temp = onDestroy
    function onDestroy()
        runHaxeCode([[
            FlxG.signals.gameResized.remove(fixShaderCoordFix);
            return;
        ]])
        if (temp) then temp() end
    end
end

