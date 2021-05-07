tests
testRetrieveClass
	| classPackageName sampleSelector artifact snapshot |
	self snapshotClass: self class at: 'src/Squot-Tests.package/SquotImageToFileStoreTest.class'.
	classPackageName := class category.
	sampleSelector := thisContext selector.
	snapshot := fileStore captureSnapshot.
	artifact := snapshot artifactAt: 'src/', classPackageName, '.package/', class name, '.class'.
	self assert: class class name equals: (artifact storeInfo at: #objectClassName).
	self assert: (artifact shadowOfTrackedObject isKindOf: SquotClassShadow).