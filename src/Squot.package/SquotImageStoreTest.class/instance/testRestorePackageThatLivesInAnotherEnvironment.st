tests
testRestorePackageThatLivesInAnotherEnvironment
	| package snapshot packageArtifact class classRef |
	"Make sure package is restored in testEnvironment even though the store binds to
	another environment."
	[imageStore environment: self class environment.
	testEnvironment beCurrentDuring:
		[class := classFactory newClass.
		classRef := class asClassReference. "which stores name and environment, and stays"
		package := MCPackage named: classFactory packageName.
		imageStore add: (self newPackageInfoFor: classFactory packageName) at: 'src'].
	snapshot := imageStore captureSnapshot.
	self assert: ((packageArtifact := snapshot artifacts
				detect: [:each | each path endsWith: '.package']
				ifNone: [self fail: 'No artifact for the package generated'])
			content definitions includes: class asClassDefinition)
		description: 'ImageStore must find the class'.
	self assert: testEnvironment
		identical: (MCWorkingCopy forPackage: package) environment
		description: 'prerequisite: MCWorkingCopy environment'.
	classFactory delete: class. "so it can be restored from the snapshot"
	imageStore restoreToSnapshot: snapshot.
	self assert: (testEnvironment hasClassNamed: classRef className)
		description: 'reloaded class in correct environment'.
	self deny: (Environment current hasClassNamed: classRef className)
		description: 'loaded class in wrong environment'.
	self deny: (packageArtifact storeInfo anySatisfy: [:each | each isKindOf: Environment])
		description: 'stored artifact should not know the environment']
	ensure:
		[(Environment current hasClassNamed: classRef className) "wrong environment"
			ifTrue: [classFactory delete: (Environment current at: classRef className)]].