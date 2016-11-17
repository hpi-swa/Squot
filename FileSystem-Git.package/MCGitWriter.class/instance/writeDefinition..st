writing
writeDefinition: aDefinition
	self flag: #GitTodo. "no double dispatch? MC*Definition has #accept:"
	aDefinition isOrganizationDefinition
		ifTrue: [ ^ self writePackageDefinition: aDefinition ].
		
	aDefinition isClassDefinition
		ifTrue: [ ^ self writeClassDefinition: aDefinition ].
		
	aDefinition isMethodDefinition
		ifTrue: [ ^ self writeMethodDefinition: aDefinition ].
		
	self error: 'unknown definition for removal'.