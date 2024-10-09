running
run
	^ (self browser actionReword: self commit)
		then: [:x | self nextOperation]