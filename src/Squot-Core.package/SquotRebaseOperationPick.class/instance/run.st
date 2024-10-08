running
run
	^ (self workingCopy cherryPick: self commit)
		then: [:x | self nextOperation]