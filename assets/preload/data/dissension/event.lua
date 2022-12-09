function onCreate()
    setProperty('camHUD.visible',false)
end

function onSongStart()
    doTweenAlpha('uhuh','camGame',1,2.5,'quadInOut')
    doTweenZoom('uh','camGame',1,2.5,'quadInOut')
    setProperty('defaultCamZoom',1)
    cameraSetTarget('dad')
    setProperty('healthBar.alpha',0.7)
    setProperty('scoreBar.alpha',0.6)
    for i = 0,7 do
        setPropertyFromGroup('strumLineNotes',i,'alpha',0.7)
    end
end

function onStepHit()
    if curStep == 128 then
        setProperty('camHUD.visible',true)
        setProperty('camGame.zoom',1.2)
        setProperty('defaultCamZoom',1.2)
        room(true)
        doTweenZoom('uh','camGame',1,1,'quadInOut')
        setProperty('defaultCamZoom',1)
    end
 
    if curStep == 400 then
        runHaxeCode([[
            game.initLuaShader('aberration');

            shader0 = game.createRuntimeShader('aberration');

            game.camGame.setFilters([new ShaderFilter(shader0)]);
            shader0.setFloat('aberration',0.05);
            shader0.setFloat('effectTime',0.1);
            ]])  
        room(false)
        setProperty('boyfriend.visible',true)
        setProperty('dad.alpha',0)
        setProperty('boyfriend.alpha',0)
        setProperty('defaultCamZoom',0.85)
        setProperty('boyfriend.y',-570)
        setProperty('dad.y',600)
        doTweenY('dad','dad',450,6,'quadOut')
        doTweenY('bf','boyfriend',0,6,'quadOut')
        doTweenAlpha('bfalpha','boyfriend',1,6,'quadOut')
        doTweenAlpha('dadalpha','dad',1,6,'quadOut')
    end
    if curStep == 401 then --fix
        setProperty('defaultCamZoom',0.85)
    end
    if curStep == 904 then
        setProperty('camGame.visible',false)
        setProperty('dad.alpha',0.45)
        setProperty('boyfriend.alpha',0.45)
    end
    if curStep == 912 then
        setProperty('camGame.visible',true)
    end
    if curStep == 1439 then
        playSound('DissensionDeath',1)
    end
    if curStep == 1440 then
        playAnim('boyfriend','singDOWN',true)
        doTweenY('goodbye','boyfriend',getProperty('boyfriend.y')-750,2.5,'quadInOut')
        setProperty('health',0.01)
        for i = 4,7 do
            noteTweenAlpha('goobye'..i,i,0,2.5,'quadInOut')
        end
    end
end
function onBeatHit()
    if curStep >= 912 and curStep <= 1040 then
        setProperty('redOverlay.alpha',1)
        doTweenAlpha('redover','redOverlay',0,1.5,'quadInOut')
    end
end
 
function onUpdate()
    if curStep >= 128 and curStep <= 400 then
        if mustHitSection then
            setProperty('defaultCamZoom',1)
        else
            setProperty('defaultCamZoom',1.15)
        end
    end
    if curStep >= 400 then
        if getProperty('health') > 0.4 then
            setProperty('health',getProperty('health')-0.0006)
        end
    end
        
end
function room(ishide)
    setProperty('wall.visible',ishide)
    setProperty('portrait.visible',ishide)
    setProperty('lacama.visible',ishide)
    setProperty('laalmuada.visible',ishide)
end