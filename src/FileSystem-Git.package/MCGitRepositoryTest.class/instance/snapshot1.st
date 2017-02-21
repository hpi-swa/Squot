building
snapshot1
	^ (MCSnapshot fromDefinitions: 
		(Array  
			with: (MCClassDefinition 
				name: 'ClassY'
				superclassName: 'Object'
				category: 'y' 
				instVarNames: ''
				comment: 'comment y')))