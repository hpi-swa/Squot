running
run
	^ (self browser actionRevert: self commit)
		then: [:x | self nextOperation]