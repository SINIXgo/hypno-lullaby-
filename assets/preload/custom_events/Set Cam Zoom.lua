function onEvent(name,value1,value2)
    if songName == 'Missingno' then
        theease = 'expoIn'
    elseif songName == 'Shitno' then
        theease = 'quadInOut'
    else
        theease = 'sineInOut'
    end
    if name == "Set Cam Zoom" then
        
        if value2 == '' then
      	  setProperty("defaultCamZoom",value1)

	else
            doTweenZoom('camz','camGame',tonumber(value1),tonumber(value2),theease)
	end
            
    end


end

function onTweenCompleted(name)

if name == 'camz' then


      	 setProperty("defaultCamZoom",getProperty('camGame.zoom')) 

end


end