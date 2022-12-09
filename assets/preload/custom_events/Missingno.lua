local defaultNotePos = {};
function onSongStart()
    for i = 0,7 do 
        x = getPropertyFromGroup('strumLineNotes', i, 'x')

        y = getPropertyFromGroup('strumLineNotes', i, 'y')

        table.insert(defaultNotePos, {x,y})
    end
end
function onEvent(name,value1,value2)
if name == 'Missingno' then 
	for i = 0,3 do
		setPropertyFromGroup('strumLineNotes',i,'alpha',0)
	end
	if value1 == '' then
	runHaxeCode([[
		shader0.setFloat("prob", ]] .. getRandomFloat(0.05,0.3) .. [[);
	]])
	for i = 4,7 do 
		setPropertyFromGroup('strumLineNotes', i, 'x', 
		defaultNotePos[i + 1][1] + math.floor(math.random(-1050+(112 * i),-850+(112 * i))))
		setPropertyFromGroup('strumLineNotes', i, 'y', 
		defaultNotePos[i + 1][2] + math.floor(math.random(200,350)))
        if downscroll then
            setPropertyFromGroup('strumLineNotes', i, 'y', 
            defaultNotePos[i + 1][2] + math.floor(math.random(-300,0)))
        end
	end
    else
		runHaxeCode([[
			shader0.setFloat("prob", ]] .. getRandomFloat(0.15,0.55) .. [[);
		]])
	end
end	
end
function onUpdate()
    setShaderFloat('shader0', 'time', clock.os())
end
function shaderCoordFix()
    runHaxeCode([[
        resetCamCache = function(?spr) {
            if (spr == null || spr.filters == null) return;
            spr.__cacheBitmap = null;
            spr.__cacheBitmapData3 = spr.__cacheBitmapData2 = spr.__cacheBitmapData = null;
            spr.__cacheBitmapColorTransform = null;
        }
        
        fixShaderCoordFix = function(?_) {
            resetCamCache(game.camGame.flashSprite);
            resetCamCache(game.camHUD.flashSprite);
            resetCamCache(game.camOther.flashSprite);
        }
    
        FlxG.signals.gameResized.add(fixShaderCoordFix);
        fixShaderCoordFix();
    ]])
    
    local temp = onDestroy
    function onDestroy()
        runHaxeCode([[
            FlxG.signals.gameResized.remove(fixShaderCoordFix);
        ]])
        temp()
    end
end