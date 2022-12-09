function onCreatePost()
    initLuaShader('aberration',130)
    initLuaShader('snowfall',130)
    makeLuaSprite("grapshad")
    makeLuaSprite("grapshad2")
    setSpriteShader('grapshad','aberration')
    setSpriteShader('grapshad2','snowfall')
    runHaxeCode([[
        game.camOther.setFilters([new ShaderFilter(game.getLuaObject("grapshad2").shader)]);
        //game.camGame.setFilters([new ShaderFilter(game.getLuaObject("grapshad").shader)]);

        ]])  
end
local abbCur = 0.75;
local abbTarget = 0.75;

function mathlerp(from,to,i)return from+(to-from)*i end

function onUpdate(elapsed)
   -- abbCur = abbCur - mathlerp(abbCur, abbTarget, (elapsed / (1 / 120)) * 0.01);
end
snowamount = 100  --100 0.2
intensity = 0.2
function onUpdatePost()
    if curStep == 662 then
        snowamount = 150
        intensity = 0.4
    end
    setShaderFloat('grapshad2','time',os.clock())
    setShaderFloat('grapshad2','intensity',intensity)
    setShaderInt('grapshad2','amount',snowamount)

    setShaderFloat('grapshad','effectTime',10000)
    setShaderFloat('grapshad','aberration',0.5)
end
