tests
testRetrievePackage
	| sampleClass packageInfo artifact snapshot |
	sampleClass := self class.
	packageInfo := PackageOrganizer default packageOfClass: sampleClass.
	self snapshotPackage: packageInfo at: 'src'.
	snapshot := fileStore captureSnapshot.
	artifact := snapshot artifactAt: 'src/', packageInfo packageName, '.package'.
	self assert: packageInfo class name equals: (artifact storeInfo at: #objectClassName).
	self assert: (artifact shadowOfTrackedObject isKindOf: SquotPackageShadow).