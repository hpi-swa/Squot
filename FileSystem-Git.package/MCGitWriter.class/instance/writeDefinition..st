writing
writeDefinition: aDefinition

	aDefinition isOrganizationDefinition
		ifTrue: [ ^ self writePackageDefinition: aDefinition ].
		
	aDefinition isClassDefinition
		ifTrue: [ ^ self writeClassDefinition: aDefinition ].
		
	aDefinition isMethodDefinition
		ifTrue: [ ^ self writeMethodDefinition: aDefinition ].
		
	self error: 'unknown definition for removal'.