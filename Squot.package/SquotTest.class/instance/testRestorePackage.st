tests
testRestorePackage
	| sampleClass packageInfo snapshot targetStore environment restoredClass |
	sampleClass := self class.
	packageInfo := PackageInfo new packageName: sampleClass category; yourself. "do not register"
	self assert: packageInfo extensionMethods isEmpty description: 'Prerequisite'.
	snapshot := self snapshotPackage: packageInfo at: 'src'.
	self flag: #metamodel.
	targetStore := SquotPurStore new. self flag: #duplication. #testRestoreClass.
	targetStore environment: (environment := self createTestEnvironment).
	targetStore restoreToSnapshot: snapshot.
	self assert: (self shouldnt: [targetStore objectAt: 'src'] raise: KeyNotFound) = packageInfo.
	self shouldnt: [restoredClass := environment at: sampleClass name] raise: KeyNotFound.
	self assert: (restoredClass isKindOf: Class).
	self assert: (environment info packages packageNames includes: packageInfo packageName).