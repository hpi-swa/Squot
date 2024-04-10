running
run
	^ (self browser actionCherryPick: self commit)
		then: [:x | self nextOperation]