actions on working copies
clone
	| operation |
	operation := SquitInteractiveClone new.
	[operation clone]
		on: SquitBadRemote do:
			[:e | e retry].
	Project current addDeferredUIMessage:
		[| projectIndex |
		projectIndex := self projectList indexOf: operation workingCopy.
		projectIndex > 0 ifTrue: [self projectIndex: projectIndex].
		self refresh].