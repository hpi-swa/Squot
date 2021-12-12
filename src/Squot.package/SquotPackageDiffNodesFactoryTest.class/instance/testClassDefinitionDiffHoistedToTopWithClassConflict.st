tests
testClassDefinitionDiffHoistedToTopWithClassConflict
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
				selector: 'new'
				category: 'private'
				timeStamp: ''
				source: 'new ^ 13'.
			MCClassDefinition
				name: 'TestClass'
				superclassName: 'Object'
				category: 'Test' 
				instVarNames: #()
				comment: 'Changed comment'.}).
	workingSnapshot := SquotPackageShadow forPackageNamed: 'Test' withSnapshot:
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
				comment: 'Differently changed comment'}).
	modifications :=
		{MCRemoval of: (workingSnapshot asMCSnapshot definitions detect: [:each | each source = 'test ^ 42']).
		MCAddition of: (incomingSnapshot asMCSnapshot definitions detect: [:each | each source = 'new ^ 13'])}.
	conflicts :=
		{MCConflict operation: (MCModification of: (workingSnapshot asMCSnapshot definitions detect: [:each | each isClassDefinition]) to: (incomingSnapshot asMCSnapshot definitions detect: [:each | each isClassDefinition]))}.
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