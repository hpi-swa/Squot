tests
testSnapshotClass
	| class classPackageName testSelector snapshot classDirectory |
	class := self class.
	classPackageName := 'Squot'.
	testSelector := thisContext selector.
	snapshot := self snapshotClass: class at: 'test.class'.
	self flag: #metamodel.
	self assert: (snapshot / 'test.class') isDirectory.
	classDirectory := snapshot / 'test.class' / (classPackageName, '.package') / (class name, '.class').
	self assert: classDirectory isDirectory.
	self assert: (classDirectory / 'properties.json') isFile.
	self assert: (classDirectory / 'instance') isDirectory.
	self assert: (classDirectory / 'instance' / (testSelector, '.st')) isFile.
	self assert: (snapshot / 'test.class' / '.squot-contents') isFile.