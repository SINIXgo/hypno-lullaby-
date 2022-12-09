function onSongStart()
    hideHudStuff(false)
    doTweenAlpha('uhuh','camGame',1,2.5,'quadInOut')
    doTweenZoom('uh','camGame',1.1,2.5,'quadInOut')
    setProperty('defaultCamZoom',1.1)
    setProperty('healthBar.alpha',0.7)
    setProperty('scoreBar.alpha',0.6)
    for i = 0,7 do
        setPropertyFromGroup('strumLineNotes',i,'alpha',0.7)
    end
end
function hideHudStuff(ishide)
    setProperty('healthBar.visible',ishide)
    setProperty('healthBarBG.visible',ishide)
    setProperty('iconP1.visible',ishide)
    setProperty('iconP2.visible',ishide)
    setProperty('scoreBar.visible',ishide)
    setProperty('centerMark.visible',ishide)
    setProperty('cornerMark.visible',ishide)
end
function onStepHit()
    if curStep == 253 then
        setProperty('camGame.visible',false)
        room(true)
    end
    if curStep == 255 then
        hideHudStuff(true)

        doTweenZoom('uh','camGame',1,1,'quadInOut')
        setProperty('defaultCamZoom',1)
    end
    if curStep == 256 then
        setProperty('camGame.visible',true)
    end
    if curStep == 656 then
        room(false)
        runHaxeCode([[
            game.initLuaShader('aberration');

            shader0 = game.createRuntimeShader('aberration');

            game.camGame.setFilters([new ShaderFilter(shader0)]);
            shader0.setFloat('aberration',0.05);
            shader0.setFloat('effectTime',0.1);
            ]])  
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
    if curStep == 657 then --fix
        setProperty('defaultCamZoom',0.85)
    end
    if curStep == 1302 then
        hideHudStuff(false)
        setProperty('camGame.visible',false)
        setProperty('dad.alpha',0.45)
        setProperty('boyfriend.alpha',0.45)
    end
    if curStep == 1312 then
        hideHudStuff(true)
        setProperty('camGame.visible',true)
    end
    if curStep == 2224 then
        playSound('DissensionDeath',1)
        playAnim('boyfriend','singDOWN',true)
        doTweenY('goodbye','boyfriend',getProperty('boyfriend.y')-750,2.5,'quadInOut')
        setProperty('health',0.01)
        for i = 4,7 do
            noteTweenAlpha('goobye'..i,i,0,2.5,'quadInOut')
        end
    end

end
function onBeatHit()
    if curStep >= 1312 and curStep <= 1696 then
        setProperty('redOverlay.alpha',1)
        doTweenAlpha('redover','redOverlay',0,1.5,'quadInOut')
    end
end
 
function onUpdate()
    if curStep >= 253 and curStep <= 656 then
        if mustHitSection then
            setProperty('defaultCamZoom',1)
        else
            setProperty('defaultCamZoom',1.15)
        end
    end
    if curStep >= 656 then
        if getProperty('health') > 0.4 then
            setProperty('health',getProperty('health')-0.00075)
        end
    end
        
end

function room(ishide)
    setProperty('wall.visible',ishide)
    setProperty('portrait.visible',ishide)
    setProperty('lacama.visible',ishide)
    setProperty('laalmuada.visible',ishide)
end