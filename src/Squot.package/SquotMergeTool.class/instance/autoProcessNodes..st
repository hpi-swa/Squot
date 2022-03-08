ui diff tree
autoProcessNodes: aCollection
	| packageNodes |
	packageNodes := ((aCollection select: [:each | each artifactDiff notNil]) select: [:each | (each content isModification or: [each content isMerge]) and: [each content object storeInfo objectClassName = #PackageInfo]]).
	self excludeMethodsWithOnlyTimestampChanges: packageNodes.
	self excludePackagesWithoutActiveChanges: packageNodes.
	^ aCollection