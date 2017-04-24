tests
testSnapshotClass
	| class classPackageName testSelector classDirectory |
	class := self class.
	classPackageName := 'Squot'.
	testSelector := thisContext selector.
	self snapshotClass: class at: 'src'.
	self assert: (fileStore / 'src') isDirectory.
	classDirectory := fileStore / 'src' / (classPackageName, '.package') / (class name, '.class').
	self assert: classDirectory isDirectory.
	self assert: (classDirectory / 'properties.json') isFile.
	self assert: (classDirectory / 'instance') isDirectory.
	self assert: (classDirectory / 'instance' / (testSelector, '.st')) isFile.
	self assert: (fileStore tableOfContents includesKey: ((classDirectory relativeTo: fileStore directory) printWithDelimiter: $/)).
	self assert: (classDirectory / SquotObjectMetadata metadataFileName) isFile.