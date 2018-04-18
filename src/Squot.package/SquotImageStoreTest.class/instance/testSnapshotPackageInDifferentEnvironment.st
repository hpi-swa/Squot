tests
testSnapshotPackageInDifferentEnvironment
	| yetAnotherEnvironment package workingCopy class snapshot |
	yetAnotherEnvironment := Environment withName: self nameForTestEnvironment, ' II'.
	yetAnotherEnvironment importSelf.
	package := MCPackage named: #VeryUnlikelyPackageName.
	self deny: package hasWorkingCopy description: 'test package must not exist'.
	(workingCopy := MCWorkingCopy forPackage: package)
		environment: yetAnotherEnvironment.
	[class := (ClassBuilder new) name: #VeryUnlikelyClassName
		inEnvironment: yetAnotherEnvironment subclassOf: Object type: #normal
		instanceVariableNames: '' classVariableNames: '' poolDictionaries: ''
		category: 'VeryUnlikelyPackageName-TestClasses'.
	self assert: (workingCopy package snapshot definitions includes: class asClassDefinition)
		description: 'Monticello must find the class'.
	imageStore add: workingCopy package packageInfo at: 'src'.
	snapshot := imageStore captureSnapshot.
	self assert: ((snapshot artifacts
					detect: [:each | each storeInfo objectClassName = PackageInfo name]
					ifNone: [self fail: 'No artifact for the package generated'])
			packageArtifactDefinitions includes: class asClassDefinition)
		description: 'ImageStore must find the class'.]
	ensure: [workingCopy unregister.
		classFactory delete: class.
		yetAnotherEnvironment destroy].