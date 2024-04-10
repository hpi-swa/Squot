running
run
	| commit |
	commit := self commitIfNilInformAnd: [:action | ^ action].
	self workingCopy
		updateHeadToAndMaterialize: commit
		message: 'reset ', commit hexHash.
	^ self nextOperation