tests
testMetaclassNodeSuffix
	| emptySnapshot populatedSnapshot modifications conflicts merge nodes metaclassNode |
	"given"
	emptySnapshot := SquotPackageShadow forPackageNamed: 'Test' withSnapshot: MCSnapshot empty.
	populatedSnapshot := SquotPackageShadow forPackageNamed: 'Test' withSnapshot:
		(MCSnapshot fromDefinitions:
			{MCClassDefinition
				name: 'TestClass'
				superclassName: 'Object'
				category: 'Test' 
				instVarNames: #()
				comment: 'No comment'.
			MCMethodDefinition
				className: 'TestClass'
				classIsMeta: true
				selector: 'test'
				category: 'private'
				timeStamp: ''
				source: 'test ^ 42'.}).
	modifications := populatedSnapshot asMCSnapshot definitions collect: [:each | MCAddition of: each].
	conflicts := #().
	merge := SquotPackageMerge
		working: emptySnapshot
		incoming: populatedSnapshot
		base: emptySnapshot
		modifications: modifications
		conflicts: conflicts.
	"when"
	nodes := SquotPackageDiffNodesFactory new topNodesForMerge: merge.
	"then"
	metaclassNode := nodes detect: [:each | each title beginsWith: 'TestClass class'] ifNone: [].
	self assert: metaclassNode notNil;
		assert: (metaclassNode title endsWith: '(added)').
	"when"
	nodes := SquotPackageDiffNodesFactory new topNodesForMerge:
		(SquotPackageMerge
		working: populatedSnapshot
		incoming: emptySnapshot "remove all"
		base: populatedSnapshot
		modifications: (populatedSnapshot asMCSnapshot definitions collect: [:each | MCRemoval of: each])
		conflicts: conflicts).
	"then"
	metaclassNode := nodes detect: [:each | each title beginsWith: 'TestClass class'] ifNone: [].
	self assert: metaclassNode notNil;
		assert: (metaclassNode title endsWith: '(removed)').