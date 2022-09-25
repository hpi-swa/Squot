initialize-release
updateBase
	SquotToggles useNewApi ifFalse: [^ self].
	self flag: #todo. "Ugly workaround for conflicts about artifact removals. The removal only has an artifact while the merges and additions have artifact snapshots. The reason is that for the removal the snapshot does not need to be captured."
	working isMerge
		ifTrue: [base := working base]
		ifFalse:
			[incoming isMerge
				ifTrue: [base := incoming base]
				ifFalse: [self isThisEverCalled]].