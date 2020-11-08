tests
testDiffTwoPackageArtifacts
	| package classNode diff diffTree snapshot1 snapshot2 titles scriptNode |
	package := PackageInfo new packageName: 'Foo'.
	snapshot1 := (MCSnapshot fromDefinitions: {
			MCClassDefinition name: #Foo superclassName: #Object category: 'Foo'
				instVarNames: #(a b c) comment: 'Foo'.
			MCMethodDefinition className: #Foo selector: #aaa category: 'accessing'
				timeStamp: 'JohnWayne 4/10/2017 20:26' source:
'aaa
	^ a'.
			MCMethodDefinition className: #Foo selector: #bbb category: 'accessing'
				timeStamp: 'JohnWayne 4/10/2017 20:26' source:
'bbb
	^ b'.
			MCMethodDefinition className: #Foo selector: #ccc category: 'accessing'
				timeStamp: 'JohnWayne 4/10/2017 20:26' source:
'ccc
	^ c'.
			MCPreambleDefinition script: 'Transcript show: #Foo1' packageName: 'Foo'.})
		asSquotArtifactForPackage: package.
	snapshot2 := (MCSnapshot fromDefinitions: {
			MCClassDefinition name: #Foo superclassName: #Object category: 'Foo'
				instVarNames: #(a c) comment: 'Foo without c'.
			MCMethodDefinition className: #Foo selector: #aaa category: 'accessing'
				timeStamp: 'JohnWayne 4/10/2017 20:26' source:
'aaa
	^ a'.
			MCMethodDefinition className: #Foo selector: #bbb category: 'accessing'
				timeStamp: 'JohnWayne 4/10/2017 20:26' source:
'bbb
	^ c'.
			MCMethodDefinition className: #Foo selector: #postCopy category: 'accessing'
				timeStamp: 'JohnWayne 4/10/2017 20:26' source:
'postCopy
	a := a copy.
	c := c copy.'.
			MCPreambleDefinition script: 'Transcript show: #Foo2' packageName: 'Foo'.})
		asSquotArtifactForPackage: package.
	diff := snapshot1 diffAgainst: snapshot2.
	diffTree := diff asDiffTree.
	self assert: diffTree children size = 2.
	self assert: (classNode := diffTree children detect: [:each | each title = 'Foo'] ifNone: []) notNil.
	self assert: classNode children size = 4.
	titles := (classNode children collect: [:each | each title]).
	self deny: (titles anySatisfy: [:each | each includesSubstring: 'aaa']).
	self assert: (titles anySatisfy: [:each | each includesSubstring: 'Foo ']).
	self assert: (titles anySatisfy: [:each | each includesSubstring: 'bbb']).
	self assert: (titles anySatisfy: [:each | each includesSubstring: 'ccc']).
	self assert: (titles anySatisfy: [:each | each includesSubstring: 'postCopy']).
	self assert: (scriptNode := diffTree children detect: [:each | each title = 'Script'] ifNone: []) notNil.
	self assert: scriptNode children size = 1.
	self assert: (scriptNode children first title includesSubstring: 'preamble').