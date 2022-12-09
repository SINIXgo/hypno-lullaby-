--script by Shadow Mario lol
function onCreatePost()
	runHaxeCode([[
		game.dadGroup.y += -70;
		for (dad in game.dadGroup)
		{
			dad.cameraPosition[1] -= 40;
		}
		bfX = game.dadGroup.x;
		bfY = game.dadGroup.y;

		fakeDad = new Character(bfX + 520, bfY+50, 'steven-end');
		fakeDad.scrollFactor.set(0.97, 0.97);
		fakeDad.y += 80;
	]]);
end

function onBeatHit()
	runHaxeCode([[
		if (]]..curBeat..[[ % fakeDad.danceEveryNumBeats == 0 && fakeDad.animation.curAnim != null && !StringTools.startsWith(fakeDad.animation.curAnim.name, 'sing') && !fakeDad.stunned)
		{
			fakeDad.dance();
		}
	]]);
end

function onStepHit()
	if curStep == 1312 then
		runHaxeCode([[
			game.add(fakeDad);
		]]);
	end
	
end

function onUpdate(elapsed)
	runHaxeCode([[
		if (game.startedCountdown && game.generatedMusic)
		{
			if (!fakeDad.stunned && fakeDad.holdTimer > Conductor.stepCrochet * 0.0011 * fakeDad.singDuration && StringTools.startsWith(fakeDad.animation.curAnim.name, 'sing') && !StringTools.endsWith(fakeDad.animation.curAnim.name, 'miss'))
			{
				fakeDad.dance();
			}
		}
	]]);
end

function opponentNoteHit(id, direction, noteType, isSustainNote)
	runHaxeCode([[
		fakeDad.playAnim(game.singAnimations[]]..direction..[[], true);
		fakeDad.holdTimer = 0;
	]]);
end