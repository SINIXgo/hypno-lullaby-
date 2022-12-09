
--made all the lyrics stuff into one piece of lua
--but the event still need to be triggered in song
function onStepHit()
    if songName == 'Isotope' then -- made by Jarcrafted Stuff (Youtube)
        if curStep == 234 then 
			setProperty('setlyric.x', getProperty('setlyric.x') + 70)
			setTextString('setlyric','      I a joke to you?')
			setTextString('sunglyric','Am')
		elseif curStep == 237 then
			setTextString('setlyric','Am    a joke to you?')
			setTextString('sunglyric','      I')
		elseif curStep == 239 then
			setTextString('setlyric','Am I    joke to you?')
			setTextString('sunglyric','         a')
		elseif curStep == 242 then
			setTextString('setlyric','Am I a          to you?')
			setTextString('sunglyric','            joke')
		elseif curStep == 245 then
			setTextString('setlyric','Am I a joke      you?')
			setTextString('sunglyric','                     to')
		elseif curStep == 248 then
			setTextString('setlyric','Am I a joke to')
			setTextString('sunglyric','                           you?')
		elseif curStep == 258 then
			setProperty('setlyric.x', getProperty('setlyric.x') - 70)
			setTextString('setlyric',' ')
			setTextString('sunglyric',' ')
		end

		if curStep == 1086 then
			setProperty('setlyric.x', getProperty('setlyric.x') + 190)
			setTextString('sunglyric','No.')
		elseif curStep == 1098 then
			setProperty('setlyric.x', getProperty('setlyric.x') - 190)
			setTextString('sunglyric',' ')
		end

    	if curStep == 1872 then
	        setTextString('setlyric', '          took everything from me...')
		    setTextString('sunglyric','They')
	    end

	    if curStep == 1875 then 
		   setTextString('setlyric', 'They            everything from me...')
		   setTextString('sunglyric','          took')
	    elseif curStep == 1879 then -- everything
           setTextString('setlyric', 'They took                      from me...')
		   setTextString('sunglyric','                    everything')
	    elseif curStep == 1885 then -- from
	    	setTextString('setlyric', 'They took everything            me...')
	    	setTextString('sunglyric','                                        from')
	    elseif curStep == 1888 then -- me...
	    	setTextString('setlyric', 'They took everything from')
	    	setTextString('sunglyric','                                                  me...')
	    end

	    if curStep == 1895 then 
		    setProperty('setlyric.x', getProperty('setlyric.x') + 150)
	    	setTextString('setlyric', '      VOICE,')
		    setTextString('sunglyric','My')
	    elseif curStep == 1900 then
	     	setTextString('setlyric', 'My')
	    	setTextString('sunglyric','      VOICE,')
	    end

	    if curStep == 1912 then
	    	setTextString('setlyric', '      FREEDOM,')
	    	setTextString('sunglyric','My')
	    elseif curStep == 1918 then
	    	setTextString('setlyric', 'My')
	    	setTextString('sunglyric','      FREEDOM,')
	    end

	    if curStep == 1932 then -- My LEGACY,
	    	setTextString('setlyric', '      LEGACY,')
	    	setTextString('sunglyric','My')
	    elseif curStep == 1938 then
	    	setTextString('setlyric', 'My')
	    	setTextString('sunglyric','      LEGACY,')
	    end

	    if curStep == 1952 then 
	    	setProperty('setlyric.x', getProperty('setlyric.x') - 150)
	    	setTextString('setlyric', '        they replaced me with some')
	    	setTextString('sunglyric','And')
	    elseif curStep == 1955 then
	    	setTextString('setlyric', 'And           replaced me with some')
	    	setTextString('sunglyric','        they')
	    elseif curStep == 1957 then
	    	setTextString('setlyric', 'And they                   me with some')
	    	setTextString('sunglyric','                 replaced')
	    elseif curStep == 1963 then
	    	setTextString('setlyric', 'And they replaced       with some')
	    	setTextString('sunglyric','                                  me')
	    elseif curStep == 1965 then
	    	setTextString('setlyric', 'And they replaced me          some')
	    	setTextString('sunglyric','                                        with')
	    elseif curStep == 1969 then
	    	setTextString('setlyric', 'And they replaced me with')
	    	setTextString('sunglyric','                                                some')
	    end

	    if curStep == 1978 then -- blue... haired... KID.
		   setProperty('setlyric.x', getProperty('setlyric.x') + 150)
		   setTextString('setlyric', ' ')
		   setTextString('sunglyric','blue...')
	    elseif curStep == 1984 then -- literally 1984
	    	setTextString('setlyric', ' ')
	    	setTextString('sunglyric','haired...')
	    elseif curStep == 1991 then
	    	setProperty('setlyric.x', getProperty('setlyric.x') + 20)
	     	setTextString('setlyric', ' ')
	    	setTextString('sunglyric','KID.')
	    elseif curStep == 2000 then
	    	setTextString('setlyric', ' ')
	    	setTextString('sunglyric',' ')
	    end
    end
-- section by laztrix
if songName == 'Dissension' then
	if curStep == 906 then
		setProperty('setlyric.x', getProperty('setlyric.x') + 120)
	    setTextString('setlyric','          bye.')
	    setTextString('sunglyric','Good')
    elseif curStep == 908 then
		setTextString('setlyric','Good    ')
	    setTextString('sunglyric','          bye.')
	elseif curStep == 912 then
		setTextString('setlyric','')
		setTextString('sunglyric','')
	end
end

    if songName == 'Shitno' then 
        --its a mess i know right?
if curStep == 88 then
	setProperty('setlyric.x', getProperty('setlyric.x') + 160)
	setTextString('setlyric','      cold...')
	setTextString('sunglyric','So')
elseif curStep == 94 then
	setTextString('setlyric','So')
	setTextString('sunglyric','      cold...')
elseif curStep == 109 then
	setProperty('setlyric.x', getProperty('setlyric.x') - 60)
	setTextString('setlyric','       is it so cold?')
	setTextString('sunglyric','Why')
elseif curStep == 113 then
	setTextString('setlyric','Why     it so cold?')
	setTextString('sunglyric','       is')
elseif curStep == 115 then
	setTextString('setlyric','Why is     so cold?')
	setTextString('sunglyric','           it')
elseif curStep == 117 then
	setTextString('setlyric','Why is it       cold?')
	setTextString('sunglyric','               so')
elseif curStep == 120 then
	setTextString('setlyric','Why is it so    ')
	setTextString('sunglyric','                     cold?')
elseif curStep == 124 then
	setTextString('setlyric','')
	setTextString('sunglyric','')
end

if curStep == 568 then 
	setProperty('setlyric.x', getProperty('setlyric.x') - 100)
	setTextString('setlyric','        away from me you freak!')
	setTextString('sunglyric','Get')
elseif curStep == 576 then
	setTextString('setlyric','Get           from me you freak!')
	setTextString('sunglyric','        away')
elseif curStep == 580 then
	setTextString('setlyric','Get away            me you freak!')
	setTextString('sunglyric','                  from')
elseif curStep == 582 then
	setTextString('setlyric','Get away from       you freak!')
	setTextString('sunglyric','                            me')
elseif curStep == 584 then
	setTextString('setlyric','Get away from me         freak!')
	setTextString('sunglyric','                                  you')
elseif curStep == 586 then
	setTextString('setlyric','Get away from me you')
	setTextString('sunglyric','                                         freak!')	
elseif curStep == 592 then
	setTextString('setlyric','')
	setTextString('sunglyric','')
end

if curStep == 2064 then 
	setProperty('setlyric.x', getProperty('setlyric.x') + 90)
	setTextString('setlyric','            me ALONE!')
	setTextString('sunglyric','Leave')
elseif curStep == 2068 then
	setTextString('setlyric','Leave       ALONE!')
	setTextString('sunglyric','            me')
elseif curStep == 2070 then
	setTextString('setlyric','Leave me')
	setTextString('sunglyric','                  ALONE!')
elseif curStep == 2078 then
	setTextString('setlyric','')
	setTextString('sunglyric','')
end
end
    setProperty('sunglyric.x', getProperty('setlyric.x')) 
end

function loadLyrics(song)
 
end