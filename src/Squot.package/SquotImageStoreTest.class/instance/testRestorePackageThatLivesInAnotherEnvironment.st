tests
testRestorePackageThatLivesInAnotherEnvironment
	| package snapshot packageArtifact class className |
	"Make sure package is restored in testEnvironment even though the store binds to
	another environment."
	[imageStore environment: self class environment.
	testEnvironment beCurrentDuring:
		[class := classFactory newClass.
		className := class name.
		package := MCPackage named: classFactory packageName.
		imageStore add: (PackageInfo named: classFactory packageName) at: 'src'].
	snapshot := imageStore captureSnapshot.
	self assert: ((packageArtifact := snapshot artifacts at: 'src'
				ifAbsent: [self fail: 'No artifact for the package generated'])
			packageArtifactDefinitions includes: class asClassDefinition)
		description: 'ImageStore must find the class'.
	self assert: testEnvironment
		identical: (MCWorkingCopy forPackage: package) environment
		description: 'prerequisite: MCWorkingCopy environment'.
	classFactory delete: class. "so it can be restored from the snapshot"
	imageStore restoreToSnapshot: snapshot.
	self assert: (testEnvironment hasClassNamed: className)
		description: 'reloaded class in correct environment'.
	self deny: (Environment current hasClassNamed: className)
		description: 'loaded class in wrong environment'.
	self deny: (packageArtifact storeInfo anySatisfy: [:each | each isKindOf: Environment])
		description: 'stored artifact should not know the environment']
	ensure:
		[(Environment current hasClassNamed: className) "wrong environment"
			ifTrue: [classFactory delete: (Environment current at: className)]].