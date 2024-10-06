running
commitImage
	^ (self browser openDialogToCommitImageWithInitialMessage: self commit message)
		then: [:x | self nextOperation]