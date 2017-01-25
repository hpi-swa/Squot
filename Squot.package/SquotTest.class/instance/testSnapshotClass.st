tests
testSnapshotClass
	| class classPackageName testSelector snapshot classDirectory |
	class := self class.
	classPackageName := 'Squot'.
	testSelector := thisContext selector.
	snapshot := self snapshotClass: class at: 'src'.
	self flag: #metamodel.
	self assert: (snapshot / 'src') isDirectory.
	classDirectory := snapshot / 'src' / (classPackageName, '.package') / (class name, '.class').
	self assert: classDirectory isDirectory.
	self assert: (classDirectory / 'properties.json') isFile.
	self assert: (classDirectory / 'instance') isDirectory.
	self assert: (classDirectory / 'instance' / (testSelector, '.st')) isFile.
	self assert: (snapshot tableOfContents includesKey: ((classDirectory relativeTo: snapshot directory) printWithDelimiter: $/)).
	self assert: (classDirectory / '.squot-contents') isFile.