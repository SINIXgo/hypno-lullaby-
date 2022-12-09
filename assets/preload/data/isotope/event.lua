local camzoom = true
function onCreatePost()
    mfw = getProperty('iconP2.y')
    setProperty('iconP2.y', mfw - 15)
	
	setProperty('scoreBar.alpha',0.6)
	setProperty('healthBar.alpha',0.6)
	setProperty('healthBarBG.alpha',0.6)
end
function onUpdatePost()
    P1Mult = getProperty('healthBar.x') + ((getProperty('healthBar.width') * getProperty('healthBar.percent') * 0.01) + (150 * getProperty('iconP1.scale.x') - 150) / 2 - 26)
    P2Mult = getProperty('healthBar.x') + ((getProperty('healthBar.width') * getProperty('healthBar.percent') * 0.01) - (150 * getProperty('iconP2.scale.x')) / 2 - 26 * 2)
    setProperty('iconP1.x',P1Mult - 90)
    setProperty('iconP1.origin.x',240)
    setProperty('iconP1.flipX',true)
    setProperty('iconP2.x',P2Mult + 90)
    setProperty('iconP2.origin.x',-100)
    setProperty('iconP2.flipX',true)
    setProperty('healthBar.flipX',true)
end

function onStepHit()
	if curStep == 256 then
       setProperty('camHUD.alpha',1)
	end
	if curStep == 1872 then
		setProperty('camGame.alpha',0)
		setProperty('scoreBar.visible', false)
		setProperty('centerMark.visible', false)
		setProperty('cornerMark.visible', false)
		setProperty('healthBar.visible',false)
		setProperty('healthBarBG.visible',false)
		setProperty('iconP1.visible', false)
		setProperty('iconP2.visible', false)
		setProperty('defaultCamZoom', 1.50)
		setProperty('dad.visible', false)
		setProperty('boyfriend.visible', false)
		setProperty('girlTits.visible', false)
        camzoom = false
		doTweenX('myvoices', 'legacyCutscene', 435, 9.0, 'quadInOut')
		doTweenAlpha('mylegacy', 'legacyCutscene', 1, 9.0, 'quadInOut')
		playAnim('legacyCutscene', 'mylegacy', true)
	end
	if curStep == 1880 then
		doTweenAlpha('naenae','camGame', 0.75, 1.6, 'quadInOut')
	end
	if curStep == 1896 then
		for i = 4,7 do
			noteTweenAlpha('bleh'..i,i,0,3,'quadInOut')
		end
	end
	if curStep == 2000 then
		camzoom = true
		removeLuaSprite('legacyCutscene',true)
		setProperty('camGame.alpha', 0)

    end
	if curStep == 2008 then
		for i = 4,7 do
			setPropertyFromGroup('strumLineNotes', i, 'alpha', 0.75)
		end
		setProperty('scoreBar.visible', true)
		setProperty('centerMark.visible', true)
		setProperty('cornerMark.visible', true)
		setProperty('healthBar.visible',true)
		setProperty('healthBarBG.visible',true)
		setProperty('iconP1.visible', true)
		setProperty('iconP2.visible', true)
		setProperty('dad.visible', true)
		setProperty('boyfriend.visible', true)
		setProperty('camGame.alpha',1)
    end
end


function onUpdate()
if camzoom then
	if mustHitSection then
		setProperty('defaultCamZoom', 0.7)
	else
		setProperty('defaultCamZoom', 0.85) -- normal is 0.85
	end
end
end
