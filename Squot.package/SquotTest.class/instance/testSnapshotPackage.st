tests
testSnapshotPackage
	| sampleClass packageInfo snapshot packageDirectory classDirectory |
	sampleClass := self class.
	packageInfo := PackageOrganizer default packageOfClass: sampleClass.
	snapshot := self snapshotPackage: packageInfo at: 'src'.
	self flag: #metamodel.
	packageDirectory := snapshot / 'src' / (packageInfo packageName, '.package').
	self assert: packageDirectory isDirectory.
	self assert: (packageDirectory / 'properties.json') isFile.
	classDirectory := packageDirectory / (sampleClass name, '.class').
	self assert: classDirectory isDirectory.
	self assert: (packageDirectory / '.squot-contents') isFile.