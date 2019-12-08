tests
testRetrieveClass
	| class classPackageName testSelector artifact snapshot |
	class := self class.
	classPackageName := class category.
	testSelector := thisContext selector.
	self snapshotClass: class at: 'src/Squot-Tests.package/SquotImageToFileStoreTest.class'.
	snapshot := fileStore captureSnapshot.
	artifact := snapshot artifactAt: 'src/', classPackageName, '.package/', class name, '.class'.
	self assert: class class name equals: (artifact storeInfo at: #objectClassName).
	self assert: (artifact shadowOfTrackedObject isKindOf: SquotClassShadow).