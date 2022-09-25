accessing
idOfObject: anObject
	| detectBlock artifact |
	(anObject isKindOf: PackageInfo)
		ifTrue: [detectBlock := [:each | each storeInfo references anySatisfy: [:eachRef | (eachRef at: 'type') = 'package' and: [(eachRef at: 'packageName') = anObject packageName]]]]
		ifFalse: [detectBlock := [:each | ((workingCopy storeForArtifact: each) isKindOf: SquotValueHolderStore) and: [(workingCopy storeForArtifact: each) contents == anObject]]].
	artifact := workingCopy project artifacts detect: detectBlock ifNone: [].
	^ artifact ifNotNil: [artifact id]