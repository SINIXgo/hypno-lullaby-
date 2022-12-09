local unknown = nil
local mfismiddlescroll = unknown
function onCreate()  
  
    consistentPositionX = -1130
    consistentPositionY = -350
valuescale = 6

makeLuaSprite('bgalt', 'stages/buried/images/bg-gray', consistentPositionX, consistentPositionY);
addLuaSprite('bgalt', false);
scaleObject('bgalt', valuescale, valuescale)  

makeLuaSprite('flooralt', 'stages/buried/images/floor-gray', consistentPositionX, consistentPositionY);
addLuaSprite('flooralt', false);
scaleObject('flooralt', valuescale, valuescale)  

makeLuaSprite('gravesalt', 'stages/buried/images/graves-gray', consistentPositionX, consistentPositionY);
addLuaSprite('gravesalt', false);
scaleObject('gravesalt', valuescale,valuescale)  



makeLuaSprite('bg', 'stages/buried/images/bg', consistentPositionX, consistentPositionY);
addLuaSprite('bg', false);
scaleObject('bg', valuescale, valuescale)  

makeLuaSprite('floor', 'stages/buried/images/floor', consistentPositionX, consistentPositionY);
addLuaSprite('floor', false);
scaleObject('floor', valuescale, valuescale)  

makeLuaSprite('graves', 'stages/buried/images/graves', consistentPositionX, consistentPositionY);
addLuaSprite('graves', false);
scaleObject('graves', valuescale,valuescale)  

makeLuaSprite('bahealth',nil,1000,670)
makeGraphic('bahealth',200,20,'87A1A6')
addLuaSprite('bahealth')
setObjectCamera('bahealth','camHUD')

makeLuaSprite('redOverlay', 'stages/mikes-room/images/redoverlay', 0, 0)
setObjectCamera('redOverlay', 'other')
addLuaSprite('redOverlay',false)
setProperty('redOverlay.visible',false)

makeLuaSprite('buried_bf', 'stages/buried/images/buried_bf', 0, 30);
addLuaSprite('buried_bf', false);
setObjectCamera('buried_bf', 'hud');
scaleObject('buried_bf', 3, 3)  

makeLuaSprite('buried_hud', 'stages/buried/images/buried_hud', 786, 530);
addLuaSprite('buried_hud', false);
setObjectCamera('buried_hud', 'hud');
scaleObject('buried_hud', 3, 3)  

setProperty('buried_hud.antialiasing', false)
setProperty('buried_bf.antialiasing', false)

setProperty('bg.antialiasing', false)
setProperty('graves.antialiasing', false)
setProperty('floor.antialiasing', false)


setProperty('bgalt.antialiasing', false)
setProperty('gravesalt.antialiasing', false)
setProperty('flooralt.antialiasing', false)

setProperty('skipCountdown',true)

if downscroll then
    setProperty('bahealth.x',getProperty('buried_bf.x')+90)
    setProperty('bahealth.y',getProperty('buried_bf.y')+140)
end

if middlescroll then
    setPropertyFromClass("ClientPrefs", "middleScroll", false)
    mfismiddlescroll = true
end
end 

function onDestroy()
    if mfismiddlescroll then
        setPropertyFromClass("ClientPrefs", "middleScroll", true)
    end
end
function onCreatePost()
    initLuaShader("wavybu")
    initLuaShader('vignetteApparition')

    setSpriteShader('redOverlay','vignetteApparition')


    setProperty('cornerMark.y',690)
    setProperty('centerMark.y',screenHeight - 40)
    setProperty('scoreBar.y',5)

    setTextFont("centerMark","poke.ttf")
    setTextFont("scoreBar","poke.ttf")
    setTextFont("cornerMark","poke.ttf")

    setTextSize('centerMark',30)
    setTextSize('scoreBar',25)
    setTextSize('cornerMark',25)
end
local curwav = 0
local shakytime = 0
function shaky(time)
    shakytime = time
    setProperty('camGame.x',-10)
    doTweenX('camGame','camGame',0,shakytime,'elasticOut')
end
function onTweenCompleted(t)
    if t == 'camGame' then
        setProperty('camGame.x',10)
        doTweenX('camGame2','camGame',0,shakytime,'elasticOut')
    end
end
function onUpdate()
    setShaderFloat('redOverlay','time',os.clock()* 1.5)
    setShaderFloat('redOverlay','vignetteIntensity',0.1)
    if curStep == 96 or curStep == 112 or curStep == 128 or curStep == 136 then
        shaky(0.2)
    end
   if curStep == 144 then
    shaky(0.5)
   end
    if curStep == 20 then
        doTweenX('woahh','boyfriend',-600,1,'easeOut')
    end
    if curStep == 3456 then
        
        doTweenAlpha('bggone','bg',0,3,'sineInOut')
        doTweenAlpha('florgone','floor',0,3,'sineInOut')
        doTweenAlpha('gragone','graves',0,3,'sineInOut')
        doTweenAlpha('byemuk','muk',0,1,'sineInOut')

        curwav = 8
    end
    if curStep == 3464 then
        setProperty('redOverlay.visible',true)

        setSpriteShader('bgalt','wavybu')
        setSpriteShader('flooralt','wavybu')
        setSpriteShader('gravesalt','wavybu')
    end
end
function onUpdatePost()
   
     
    setShaderFloat('bgalt','wavy',curwav)
    setShaderFloat('flooralt','wavy',curwav)
    setShaderFloat('gravesalt','wavy',curwav)
    
    setShaderFloat('bgalt','iTime',os.clock())
    setShaderFloat('flooralt','iTime',os.clock())
    setShaderFloat('gravesalt','iTime',os.clock())
end