tests
testSnapshotClass
	| classPackageName sampleSelector classDirectory |
	self snapshotClass: self class at: 'src/Squot-Tests.package/SquotImageToFileStoreTest.class'.
	classPackageName := class category.
	sampleSelector := thisContext selector.
	self assert: (fileStore / 'src') isDirectory.
	classDirectory := fileStore / 'src' / (classPackageName, '.package') / (class name, '.class').
	self assert: classDirectory isDirectory.
	self assert: (classDirectory / 'properties.json') isFile.
	self assert: (classDirectory / 'instance') isDirectory.
	self assert: (classDirectory / 'instance' / (sampleSelector, '.st')) isFile.
	self assert: (fileStore tableOfContents includesKey: ((classDirectory relativeTo: fileStore directory) printWithDelimiter: $/)).
	self assert: (classDirectory / SquotObjectMetadataFile metadataFileName) isFile.