accessing
pathsOf: anObject
	| artifact detectBlock |
	artifact := artifacts keyAtValue: anObject ifAbsent: [].
	artifact ifNil:
		[(anObject isKindOf: PackageInfo)
			ifTrue: [detectBlock := [:each | (each storeInfo references anySatisfy: [:eachRef | (eachRef at: 'type') = 'package' and: [(eachRef at: 'packageName') = anObject packageName]]) and: [(workingCopy storeForArtifact: each) includesArtifact: each]]]
			ifFalse: [detectBlock := [:each | ((workingCopy storeForArtifact: each) isKindOf: SquotValueHolderStore) and: [(workingCopy storeForArtifact: each) contents == anObject]]].
		artifact := workingCopy project artifacts detect: detectBlock ifNone: []].
	artifact ifNil: [^ #()].
	^ {artifact path}