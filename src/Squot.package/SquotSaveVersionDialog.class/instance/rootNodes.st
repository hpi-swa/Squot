ui diff tree
rootNodes
	SquotToggles ignoreMethodsInAssumeUnchanged ifFalse: [^ super rootNodes].
	rootNodes ifNil: 
		[super rootNodes.
		self excludeMethodsThatAreAssumedUnchanged].
	^ super rootNodes