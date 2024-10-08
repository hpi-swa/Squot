running
commitImage
	^ (self workingCopy openDialogToCommitImageWithInitialMessage: self commit message)
		then: [:x | self nextOperation]