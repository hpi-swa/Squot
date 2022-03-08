ui diff tree
autoProcessNodes: nodes
	| packageNodes |
	packageNodes := ((nodes select: [:each | each artifactDiff notNil]) select: [:each | each content isModification and: [each content object storeInfo objectClassName = #PackageInfo]]).
	SquotToggles ignoreMethodsInAssumeUnchanged ifTrue:
		[self excludeMethodsThatAreAssumedUnchanged: packageNodes].
	self excludeMethodsWithOnlyTimestampChanges: packageNodes.
	self excludePackagesWithoutActiveChanges: packageNodes.
	^ nodes