actions on working copies
clone
	| operation |
	operation := SwaSquitInteractiveClone new.
	[operation clone]
		on: SquitBadRemote do:
			[:e | e retry].
	Project current addDeferredUIMessage: [self refresh].