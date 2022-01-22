tests
testClassesOrderedByCategory
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
				category: 'Test-A'  "moved"
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
		MCModification of: class2b to: class2i.
		MCModification of: class3b to: class3i}.
	conflicts := #().
	merge := SquotPackageMerge
		working: workingSnapshot
		incoming: incomingSnapshot
		base: baseSnapshot
		modifications: modifications
		conflicts: conflicts.
	"when"
	nodes := SquotPackageDiffNodesBuilder new topNodesForMerge: merge.
	"The classes are ordered by their categories in the incoming version, then lexicographically."
	self assert: #(#TestClass2 #TestClass1 #TestClass3)
		equals: (nodes collect: [:each | each content className]) asArray.