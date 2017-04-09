tests
testSnapshotPackage
	| sampleClass packageInfo packageDirectory classDirectory |
	sampleClass := self class.
	packageInfo := PackageOrganizer default packageOfClass: sampleClass.
	self snapshotPackage: packageInfo at: 'src'.
	packageDirectory := fileStore / 'src' / (packageInfo packageName, '.package').
	self assert: packageDirectory isDirectory.
	self assert: (packageDirectory / 'properties.json') isFile.
	classDirectory := packageDirectory / (sampleClass name, '.class').
	self assert: classDirectory isDirectory.
	self assert: (packageDirectory / '_squot-contents') isFile.