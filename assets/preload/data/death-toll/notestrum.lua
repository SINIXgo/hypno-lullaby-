--[[
 BASE SCRIPT CREDITS:
		- ShadowMario: made a multi-character script (from which I took animation offset)
		- Superpowers04: Helped with optimizing some code
		- MorenoTheCappuccinoChugger: Helped with note syncing (previous version on my youtube channel was off-sync)
		- BombasticTom (that's me!): Did most of the code.

	GONG MECHANIC CREDITS:
		- Laztrix
--]]

animationsList = {}

local defaultstrumy
local noteoffset

local isStrummin = true
local defaultNotePos = {};
function onSongStart()
    for i = 0,7 do
        x = getPropertyFromGroup('strumLineNotes', i, 'x')

        y = getPropertyFromGroup('strumLineNotes', i, 'y')

        table.insert(defaultNotePos, {x, y})
    end
end
function makeAnimationList()
	animationsList[0] = 'keyArrow' -- idle
	animationsList[1] = 'keyConfirm' -- key confirmed
	animationsList[2] = 'keyPressed' -- key miss
end

offsets = {};

function makeOffsets(object)
	offsets[0] = {x=20, y=500}
	offsets[1] = {x=61, y=59}
	offsets[2] = {x=34, y=34}
end

function onCreatePost()

    notey = 570
	noteoffset = -570
	if not downscroll then
		noteoffset = 50
		notey = 50

	end
    if not middlescroll then
		curnotex = 265
	else
		curnotex = 440
	end
	directions = "space"
	makeAnimationList()
	makeOffsets()

		makeAnimatedLuaSprite('strum'..directions, 'UI/base/hellbell/Bronzong_Gong_mechanic', curnotex,notey)
	
		addAnimationByPrefix('strum'..directions, 'keyConfirm', 'spacebar confirm', 24, false)
		addAnimationByPrefix('strum'..directions, 'keyPressed', 'spacebar press', 24, false)
		addAnimationByIndicesLoop('strum'..directions, 'keyArrow', 'spacebar',"0,1,2,3,4", 24)

		setObjectCamera('strum'..directions, 'camHUD')
		scaleObject('strumspace',0.75,0.75)
		
		addLuaSprite('strum'..directions)

		playAnimation('strum'..directions, 0, true)	
end

function playAnimation(character, animId, forced) -- thank you shadowmario :evil:
	-- 0 = keyArrow
	-- 1 = keyConfirm
	-- 2 = keyPressed
	animName = animationsList[animId]

	playAnim(character, animName, forced); -- this part is easily broke if you use objectPlayAnim (I have no idea why its like this)	
end
local coverup = true
local allowedtouch = false
local bfcover = false
local gfcover = false

fr = 0
function onUpdate(elapsed)
fr = fr + elapsed
gurg = ((getPropertyFromClass('Conductor', 'songPosition') / 1000)*(bpm/240))
gurg1 = ((getPropertyFromClass('Conductor', 'songPosition') / 1000)*(bpm/350))
songPos = getSongPosition()
local currentBeat = (songPos/4000)*(curBpm/70)
	if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.SPACE') then
		if not botPlay then
		playAnimation('strum'..directions, 2, false)
		end
	end
    if curStep == 1504 then
		coverup = false
	end

	if curStep == 1552 then
		gfcover = true
	end
	if curStep == 1807 then
		gfcover = false
		bfcover = true
		coverup = true
	end
	if curStep == 1424 then
		setProperty('gf.alpha',0.1)
		setProperty('boyfriend.alpha',0.9)
	end
	if curStep == 1472 then
		setProperty('gf.alpha',0.2)
		setProperty('boyfriend.alpha',0.8)
	end
	if curStep == 1536 then
		setProperty('boyfriend.alpha',0.7)
		setProperty('gf.alpha',0.3)
	end
	if curStep == 1556 then
		setProperty('boyfriend.alpha',0.5)
		setProperty('gf.alpha',0.2)
	end
	if curStep >= 1568 and curStep <= 1806 then

		setProperty('boyfriend.alpha', 0.9 - 0.5 * math.cos((gurg1) * math.pi))

		setProperty('gf.alpha', 1 - 0.8 * math.cos((gurg) * math.pi))

	end
	if curStep >= 1806 then
		setProperty('gf.visible',false)
		setProperty('boyfriend.alpha',1)

	end
end
local iscoverup = false
function onUpdatePost()
	if getProperty("HellBell.animation.curAnim.name") == 'bellin' then
		if getProperty("HellBell.animation.curAnim.finished") then
			playAnim('HellBell','dance',true)
		end
	end
	if getProperty("strumspace.animation.curAnim.name") == 'keyPressed' then
		if getProperty("strumspace.animation.curAnim.finished") then
			playAnimation('strum'..directions, 0, true)
		end
	end
	if getProperty("boyfriend.animation.curAnim.name") == 'coverup' then
		if getProperty("boyfriend.animation.curAnim.finished") then
           setProperty('boyfriend.specialAnim',false)
		end
	end
	if getProperty("strumspace.animation.curAnim.name") == 'keyConfirm' then
		if getProperty("strumspace.animation.curAnim.finished") then
			playAnimation('strum'..directions, 0, true)
		end
	end
	
	for i=0, getProperty('notes.length')-1 do
		if getPropertyFromGroup('notes', i, 'noteType') == 'bell' then
			if not isStrummin then
				return
			end

			noteX = getPropertyFromGroup('notes', i, 'x');
			noteY = getPropertyFromGroup('notes', i, 'y');

			if getPropertyFromGroup('notes',i,'isSustainNote') then	
			if not botPlay then
			setPropertyFromGroup('notes', i, 'ignoreNote', true)
			end
			setPropertyFromGroup('notes', i, 'offset.x', -70)	
			end
			hitbox = 50;
			
			noteData = getPropertyFromGroup('notes', i, 'noteData');
			
			strumY = getProperty('strum'..directions..'.y')	

			noteX = getProperty('strum'..directions..'.x')
			if downscroll then
				noteY = (noteY - strumY - noteoffset - offsets[0].x)
			else
				noteY = (noteY + noteoffset + offsets[0].x)
			end

		
    
			setPropertyFromGroup('notes', i, 'x', noteX+10)
			setPropertyFromGroup('notes', i, 'y', noteY)
            if math.abs(noteY - strumY) <= hitbox then
				if botPlay then
					playAnimation('strum'..directions, 1, true)
					removeFromGroup('notes', i)
					if coverup then
						if not bfcover then
						triggerEvent('Change Character',"0",'altdawn-cover')
						elseif gfcover then
						triggerEvent('Change Character',"2",'dtgf-cover')
						else
						triggerEvent('Change Character',"0",'dtbf-cover')
						end
						if not iscoverup then
							setProperty('boyfriend.specialAnim',true)
							if gfcover then
								characterPlayAnim('gf','coverup',true)
							else
							characterPlayAnim('boyfriend',"coverup",true)
							end
							runTimer('uncover',1)
							iscoverup = true 
						end
					end
				end
				triggerEvent('Screen Shake','0.2,0.002','')
				playAnim('HellBell','bellin',true)
				if keyboardPressed("SPACE") and not botPlay then
					playAnimation('strum'..directions, 1, true)
					removeFromGroup('notes', i)
					if coverup then
						if not bfcover then
						triggerEvent('Change Character',"0",'altdawn-cover')
						elseif gfcover then
						triggerEvent('Change Character',"2",'dtgf-cover')
						else
						triggerEvent('Change Character',"0",'dtbf-cover')
						end
						if not iscoverup then
							setProperty('boyfriend.specialAnim',true)
							if gfcover then
								characterPlayAnim('gf','coverup',true)
							else
							characterPlayAnim('boyfriend',"coverup",true)
							end
							runTimer('uncover',1)
							iscoverup = true 
						end
					end
				else

				end

			end
			
		
			
		end
	end

end

function onTimerCompleted(t)
	if t == 'uncover' then
		iscoverup = false
		if coverup then
		if not bfcover then
		triggerEvent('Change Character',"0",'altdawn')
		elseif gfcover then
		triggerEvent('Change Character',"2",'dtgf')
		else
		triggerEvent('Change Character',"0",'dtbf')
		end	
	    end
	end
end

function noteMiss(id,noteData,noteType,isSustainNote)
	if noteType == 'bell' then
		if not isSustainNote then
		setProperty('health',getProperty('health')-0.4)
		end
	end
end