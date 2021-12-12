tests
testClassDefinitionDiffHoistedToTop
	| workingSnapshot incomingSnapshot baseSnapshot modifications conflicts merge nodes classNode |
	"given"
	baseSnapshot := SquotPackageShadow forPackageNamed: 'Test' withSnapshot:
		(MCSnapshot fromDefinitions:
			{MCMethodDefinition
				className: 'TestClass'
				selector: 'test'
				category: 'private'
				timeStamp: ''
				source: 'test ^ 42'.
			MCClassDefinition
				name: 'TestClass'
				superclassName: 'Object'
				category: 'Test' 
				instVarNames: #()
				comment: 'No comment'.}).
	incomingSnapshot := SquotPackageShadow forPackageNamed: 'Test' withSnapshot:
		(MCSnapshot fromDefinitions:
			{MCMethodDefinition
				className: 'TestClass'
				selector: 'test'
				category: 'private'
				timeStamp: ''
				source: 'test ^ 13'.
			MCClassDefinition
				name: 'TestClass'
				superclassName: 'Object'
				category: 'Test' 
				instVarNames: #()
				comment: 'Changed comment'.}).
	workingSnapshot := baseSnapshot.
	modifications :=
		{MCModification of: (workingSnapshot asMCSnapshot definitions detect: [:each | each isMethodDefinition]) to: (incomingSnapshot asMCSnapshot definitions detect: [:each | each isMethodDefinition]).
		MCModification of: (workingSnapshot asMCSnapshot definitions detect: [:each | each isClassDefinition]) to: (incomingSnapshot asMCSnapshot definitions detect: [:each | each isClassDefinition])}.
	conflicts := #().
	merge := SquotPackageMerge
		working: workingSnapshot
		incoming: incomingSnapshot
		base: baseSnapshot
		modifications: modifications
		conflicts: conflicts.
	"when"
	nodes := SquotPackageDiffNodesFactory new topNodesForMerge: merge.
	"then"
	classNode := nodes detect: [:each | each title beginsWith: 'TestClass'] ifNone: [].
	self assert: classNode notNil;
		assert: classNode children first content definition isClassDefinition.