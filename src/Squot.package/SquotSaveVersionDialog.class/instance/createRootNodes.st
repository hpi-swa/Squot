ui diff tree
createRootNodes
	| nodes |
	nodes := super createRootNodes.
	SquotToggles ignoreMethodsInAssumeUnchanged ifTrue:
		[self excludeMethodsThatAreAssumedUnchanged: nodes].
	self excludeMethodsWithOnlyTimestampChanges: nodes.
	self excludePackagesWithoutActiveChanges: nodes.
	^ nodes