running
run
	^ (self browser actionSquash: self commit editMessage: self editMessage)
		then: [:x | self nextOperation]