running
run
	^ (self browser actionMaterializeCherryPick: self commit)
		then: [:x | self edit]