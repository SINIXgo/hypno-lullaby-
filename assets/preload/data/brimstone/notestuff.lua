local separation
local receptorSep = 0 -- how much of pixels do you want each note to distance
local receptorSize = 3 -- note size [default: 0.7]
function onCreatePost()
	--[[for i = 0, getProperty('opponentStrums.length')-1 do
		setPropertyFromGroup('opponentStrums', i, 'texture', "stages/buried/images/NOTE_Brimstone");
	end
	for i = 0, getProperty('playerStrums.length')-1 do
		setPropertyFromGroup('playerStrums', i, 'texture', "stages/buried/images/NOTE_Brimstone");
	end
	for i = 0, getProperty('unspawnNotes.length')-1 do
		if getPropertyFromGroup('unspawnNotes', i, 'mustPress') then
		setPropertyFromGroup('unspawnNotes', i, 'texture', "stages/buried/images/NOTE_Brimstone");
		end
		if getPropertyFromGroup('unspawnNotes', i, 'mustPress') == false then
			setPropertyFromGroup('unspawnNotes', i, 'texture', "stages/buried/images/NOTE_Brimstone");
		end
	end]]
    separation = screenWidth / 4

	strumPosY = screenHeight / 6
	if downscroll then strumPosY = screenHeight / 1.25 end

	resizeStrumline('opponent', screenWidth / 2 - separation, strumPosY, receptorSize, receptorSep)
	resizeStrumline('player', screenWidth / 2 + separation, strumPosY, receptorSize, receptorSep)
end
function resizeStrumline(strum, x_position, y_position, scale, noteSep)
	
	local swagWidth = scale * noteSep
	local isPlayer = false
	if strum == 'player' then isPlayer = true end

	for note=0, getProperty(strum..'Strums.length')-1 do
		setPropertyFromGroup(strum..'Strums', note, 'scale.x', scale)
		setPropertyFromGroup(strum..'Strums', note, 'scale.y', scale)

		updateHitboxFromGroup(strum..'Strums', note)

		local noteX = x_position - swagWidth / 2
		noteX = noteX + (note - (3 / 2)) * swagWidth

		setPropertyFromGroup(strum..'Strums', note, 'x', noteX)
		--setPropertyFromGroup(strum..'Strums', note, 'y', y_position)
	end

	for note=0, getProperty('unspawnNotes.length')-1 do
		if getPropertyFromGroup('unspawnNotes',note,'isSustainNote')then
		setPropertyFromGroup('unspawnNotes', note, 'offset.x', -25)
		end
		if getPropertyFromGroup('unspawnNotes', note, 'mustPress') == isPlayer then
			setPropertyFromGroup('unspawnNotes', note, 'scale.x', scale)
			if getPropertyFromGroup('unspawnNotes',note,'isSustainNote')then
				setPropertyFromGroup('unspawnNotes', note, 'offset.x', -25)
				end
			if not getPropertyFromGroup('unspawnNotes', note, 'isSustainNote') then
				setPropertyFromGroup('unspawnNotes', note, 'scale.y', scale)
			end
			updateHitboxFromGroup('unspawnNotes', note)
		end
	end

end

function onUpdate()
	setProperty('camZooming',false)
end