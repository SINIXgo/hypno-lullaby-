
fr = 0
function onUpdate(elapsed)
    songPos = getSongPosition()
	local currentBeat = (songPos/4000)*(curBpm/60)
    fr = fr + elapsed
    if mustHitSection then
        setProperty('defaultCamZoom',0.75)
    else
        setProperty('defaultCamZoom',1.1)
    end
    setProperty('HellBell.y',282 + math.sin(fr*1) * 20)
    if curBeat >= 325 and curBeat <= 9999 then
        doTweenY('contr', 'ContractBF', 490 + (math.cos((currentBeat) + 0) * 20), 1)
    end
end
function onUpdatePost(elapsed)
	P1Mult = getProperty('healthBar.x') + ((getProperty('healthBar.width') * getProperty('healthBar.percent') * 0.01) + (150 * getProperty('iconP1.scale.x') - 150) / 2 - 26)
	P2Mult = getProperty('healthBar.x') + ((getProperty('healthBar.width') * getProperty('healthBar.percent') * 0.01) - (150 * getProperty('iconP2.scale.x')) / 2 - 26 * 2)
	setProperty('iconP1.x',P1Mult - 110)
	setProperty('iconP1.origin.x',240)
	setProperty('iconP1.flipX',true)
	setProperty('iconP2.x',P2Mult + 110)
	setProperty('iconP2.origin.x',-100)
	setProperty('healthBar.flipX',true)
end
function onStepHit()
    if curStep == 1328 then
        playAnim('ContractBF','a1',true)
    elseif curStep == 1376 then
        playAnim('ContractBF','a2',true)
    elseif curStep == 1425 then
        playAnim('ContractBF','a3',true)
    elseif curStep == 1474 then
        playAnim('ContractBF','a4',true)
    elseif curStep == 1524 then
        playAnim('ContractBF','a5',true)
    elseif curStep == 1556 then
        playAnim('ContractBF','a6',true)
    elseif curStep == 1624 then
        playAnim('ContractBF','a7',true)
    elseif curStep == 1680 then
        playAnim('ContractBF','a8',true)
    elseif curStep == 1748 then
        playAnim('ContractBF','a9',true)
    end
end