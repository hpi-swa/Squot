test objects
patchModifyingMethodTimestampInArtifactAt: path
	| artifact incoming |
	artifact := ((MCSnapshot fromDefinitions: {
			MCClassDefinition name: 'TestClass' superclassName: 'Object' category: 'TestPackage' instVarNames: '' comment: ''.
			MCMethodDefinition className: 'TestClass' classIsMeta: false selector: 'a'
				category: 'changed stamps' timeStamp: '' source: 'a ^ self'. "must match decompiler output"
		}) asSquotArtifactForPackage: (PackageInfo new packageName: 'TestPackage'))
		path: path.
	workingCopy := SquotWorkingCopy forTestInMemory.
	SystemChangeNotifier uniqueInstance doSilently:
		[workingCopy add: artifact.
		[incoming := SquotSnapshot builder
			add: (((MCSnapshot fromDefinitions: {
					artifact packageArtifactDefinitions detect: [:each | each isClassDefinition].
					MCMethodDefinition className: 'TestClass' classIsMeta: false selector: 'a'
						category: 'changed stamps' timeStamp: '2' source: ((Smalltalk at: #TestClass) >> #a) getSource.
				}) asSquotArtifactForPackage: (PackageInfo new packageName: 'TestPackage'))
					path: path);
			buildSnapshot.
		^ SquotMerge into: workingCopy
			merge: incoming
			basedOn: workingCopy lazySnapshot
		] ensure:
			[(MCPackage named: 'TestPackage') unload
			"This means that the merge cannot be applied, so test cases must not attempt to do so."]]