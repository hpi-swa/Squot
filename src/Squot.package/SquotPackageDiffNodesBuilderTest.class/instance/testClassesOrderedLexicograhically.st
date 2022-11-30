tests
testClassesOrderedLexicograhically
	| workingSnapshot incomingSnapshot baseSnapshot class1b class1i class2b class2i class3b class3i modifications conflicts merge nodes |
	"given"
	baseSnapshot := SquotPackageShadow forPackageNamed: 'Test' withSnapshot:
		(MCSnapshot fromDefinitions:
			{MCOrganizationDefinition categories: #('Test-B' 'Test-A').
			class1b := MCClassDefinition
				name: 'TestClass1'
				superclassName: 'Object'
				category: 'Test-A' 
				instVarNames: #()
				comment: 'No comment'.
			class3b := MCClassDefinition
				name: 'TestClass3'
				superclassName: 'Object'
				category: 'Test-B' 
				instVarNames: #()
				comment: 'No comment'.
			class2b := MCClassDefinition
				name: 'TestClass2'
				superclassName: 'Object'
				category: 'Test-B' 
				instVarNames: #()
				comment: 'No comment'}).
	incomingSnapshot := SquotPackageShadow forPackageNamed: 'Test' withSnapshot:
		(MCSnapshot fromDefinitions:
			{MCOrganizationDefinition categories: #('Test-B' 'Test-A').
			class1i := MCClassDefinition
				name: 'TestClass1'
				superclassName: 'Object'
				category: 'Test-A' 
				instVarNames: #()
				comment: 'Changed comment'.
			class3i := MCClassDefinition
				name: 'TestClass3'
				superclassName: 'Object'
				category: 'Test-A'  "changed category (we once tried to have classes sorted by category, but since you don't see the categories in the diff tree, the order was rather surprising than helpful)"
				instVarNames: #()
				comment: 'Changed comment'.
			class2i := MCClassDefinition
				name: 'TestClass2'
				superclassName: 'Object'
				category: 'Test-B' 
				instVarNames: #()
				comment: 'Changed comment'}).
	workingSnapshot := baseSnapshot.
	modifications :=
		{MCModification of: class1b to: class1i.
		MCModification of: class3b to: class3i. "deliberately not in the expected order"
		MCModification of: class2b to: class2i}.
	conflicts := #().
	merge := SquotPackageMerge
		working: workingSnapshot
		incoming: incomingSnapshot
		base: baseSnapshot
		modifications: modifications
		conflicts: conflicts.
	"when"
	nodes := SquotPackageDiffNodesBuilder new topNodesForMerge: merge.
	"The classes are ordered lexicographically by their names."
	self assert: #(#TestClass1 #TestClass2 #TestClass3)
		equals: (nodes collect: [:each | each content className]) asArray.