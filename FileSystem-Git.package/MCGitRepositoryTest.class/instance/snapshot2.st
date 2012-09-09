building
snapshot2
	^ (MCSnapshot fromDefinitions: 
		(Array 
			with: (MCClassDefinition 
				name: 'ClassX'
				superclassName: 'Object'
				category: 'x' 
				instVarNames: ''
				comment: 'comment x')))