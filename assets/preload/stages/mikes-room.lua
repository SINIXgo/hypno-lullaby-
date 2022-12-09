function onCreatePost()
    makeLuaSprite('wall', 'stages/mikes-room/images/back', -300, 100);
    setScrollFactor('wall', 0.7, 0.7);
    addLuaSprite('wall',false)

    makeLuaSprite('portrait', 'stages/mikes-room/images/portrait', -300, 100);
    setScrollFactor('portrait', 0.7, 0.7);
    addLuaSprite('portrait',false)

    makeLuaSprite('lacama', 'stages/mikes-room/images/bed', -300, 100);
    setScrollFactor('lacama', 0.9, 0.9);
    addLuaSprite('lacama',false)

    makeLuaSprite('laalmuada', 'stages/mikes-room/images/pillow', -300, 100);
    setScrollFactor('laalmuada', 0.9, 0.9);
    addLuaSprite('laalmuada',false)


    makeLuaSprite('redOverlay', 'stages/mikes-room/images/redoverlay', 0, 0)
    setObjectCamera('redOverlay', 'camHUD')
    addLuaSprite('redOverlay',false)
    setProperty('redOverlay.alpha',0.04)
 

    setObjectOrder('dadGroup',getObjectOrder('lacama'))
    setProperty('gf.visible', false);
    setProperty('boyfriend.visible', false);


    setProperty('wall.visible',false)
    setProperty('portrait.visible',false)
    setProperty('lacama.visible',false)
    setProperty('laalmuada.visible',false)
   
    setProperty('camGame.alpha',0)
end
function onCreate()
    setProperty('skipCountdown', true)
end
