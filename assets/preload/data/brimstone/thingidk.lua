
function onCreatePost()
setProperty('healthBarBG.visible', false)
setProperty('healthBar.x',getProperty('buried_bf.x')-90)
setProperty('healthBar.y',getProperty('buried_bf.y')+140)
setObjectOrder('healthBar',getObjectOrder('buried_bf')-1)
setProperty('healthBar.flipX',true)
setProperty('healthBar.scale.x',0.27)
setProperty('healthBar.scale.y',1.9)
setProperty('scoreTxt.visible', false)
setProperty('iconP1.visible', false)
setProperty('iconP2.visible', false)	

for i = 4,7 do 
	setPropertyFromGroup('strumLineNotes', i, 'x', 10 + (95 * (i % 4)))
end
for i=0,3 do
setPropertyFromGroup('strumLineNotes', i, 'downScroll', true)
setPropertyFromGroup('strumLineNotes', i, 'x', 890 + (95 * (i % 4)))
setPropertyFromGroup('strumLineNotes',i,'y',550)
end
if downscroll then
    for i = 4,7 do 
        setPropertyFromGroup('strumLineNotes', i, 'x', 890 + (95 * (i % 4)))
        setPropertyFromGroup('strumLineNotes',i,'y',550)
    end
    for i=0,3 do
        setPropertyFromGroup('strumLineNotes',i,'y',50)
    setPropertyFromGroup('strumLineNotes', i, 'downScroll', false)
    setPropertyFromGroup('strumLineNotes', i, 'x', 10 + (95 * (i % 4)))
    end

    setProperty('healthBar.x',getProperty('buried_hud.x')+22)
    setProperty('healthBar.y',getProperty('buried_hud.y')+140)

end    
    
		setProperty('gf.visible',false)
end


function onUpdatePost(elapsed)
    

	noteCount = getProperty('notes.length');

	for i = 0, noteCount-1 do

		noteData = getPropertyFromGroup('notes', i, 'noteData')
		if getPropertyFromGroup('notes', i, 'isSustainNote') then
            if (getPropertyFromGroup('notes', i, 'mustPress')) then
                setPropertyFromGroup('notes', i, 'angle', getPropertyFromGroup("playerStrums", noteData, 'direction') - 90)
            else
				
                setPropertyFromGroup('notes', i, 'angle', getPropertyFromGroup("opponentStrums", noteData, 'direction') - 90)
            end	
		else
            if (noteData >= 4) then
                setPropertyFromGroup('notes', i, 'angle', getPropertyFromGroup("playerStrums", noteData, 'angle'))
            else
                setPropertyFromGroup('notes', i, 'angle', getPropertyFromGroup("opponentStrums", noteData, 'angle'))
            end	
		end
	end


end
