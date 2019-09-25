tests
testParallelAddition
	| working incoming diff merge |
	working := 
		SquotPackageShadow
			forPackageNamed: 'Package' withSnapshot:
				(MCSnapshot fromDefinitions:
					{MCClassDefinition name: 'Class1' superclassName: 'Object'
						category: 'TestCategory' instVarNames: 'a b c' comment: 'A'.
					MCMethodDefinition className: 'Class1' selector: 'onlyInA'
						category: 'clean merge' timeStamp: '' source: 'onlyInA ^ true'.
					MCMethodDefinition className: 'Class1' selector: 'conflict'
						category: 'conflicts' timeStamp: '' source: 'conflict ^ $A'}).
	incoming := 
		SquotPackageShadow
			forPackageNamed: 'Package' withSnapshot:
				(MCSnapshot fromDefinitions:
					{MCClassDefinition name: 'Class1' superclassName: 'Object'
						category: 'TestCategory' instVarNames: 'a b c d' comment: 'B'.
					MCMethodDefinition className: 'Class1' selector: 'onlyInB'
						category: 'clean merge' timeStamp: '' source: 'onlyInB ^ true'.
					MCMethodDefinition className: 'Class1' selector: 'conflict'
						category: 'conflicts' timeStamp: '' source: 'conflict ^ $B'}).
	diff := working squotDiffAgainst: incoming.
	merge := diff asSquotConflicts.
	self assert: ((merge conflicts collect: [:each | each operation]) includesAllOf:
				{MCModification
					of: (MCMethodDefinition className: 'Class1' selector: 'conflict'
						category: 'conflicts' timeStamp: '' source: 'conflict ^ $A')
					to: (MCMethodDefinition className: 'Class1' selector: 'conflict'
						category: 'conflicts' timeStamp: '' source: 'conflict ^ $B').
				MCModification
					of: (MCClassDefinition name: 'Class1' superclassName: 'Object'
						category: 'TestCategory' instVarNames: 'a b c' comment: 'A')
					to: (MCClassDefinition name: 'Class1' superclassName: 'Object'
						category: 'TestCategory' instVarNames: 'a b c d' comment: 'B')});
		assert: (merge modifications includesAllOf:
				{MCAddition of:
					(MCMethodDefinition className: 'Class1' selector: 'onlyInB'
						category: 'clean merge' timeStamp: '' source: 'onlyInB ^ true')}).