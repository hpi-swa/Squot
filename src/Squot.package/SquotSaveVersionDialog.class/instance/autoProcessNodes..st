ui diff tree
autoProcessNodes: nodes
	| packageNodes |
	packageNodes := ((nodes select: [:each | each artifactDiff notNil])
		select:
			[:each |
			(each content isModification and: [each content object storeInfo objectClassName = #PackageInfo])
				or: [each content isMerge and: [(each content incoming artifact storeInfo firstReferenceOfType: 'package' ifNone: []) notNil]]]).
	SquotToggles ignoreMethodsInAssumeUnchanged ifTrue:
		[self excludeMethodsThatAreAssumedUnchanged: packageNodes].
	self excludeMethodsWithOnlyTimestampChanges: packageNodes.
	self excludePackagesWithoutActiveChanges: packageNodes.
	^ nodes