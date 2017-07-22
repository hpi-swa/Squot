utilities
assertVersion: aVersion containsClass: aClass
	aVersion snapshot artifactsDo: [:eachArtifact |
		(eachArtifact path endsWith: '.package')
			ifTrue: [eachArtifact packageArtifactDefinitions
				detect: [:each | each isClassDefinition 
					and: [each className = aClass name]] ifFound: [:it | ^ eachArtifact] ifNone: []].
		(eachArtifact path endsWith: aClass name, '.class')
			ifTrue: [eachArtifact packageArtifactDefinitions
				detect: [:each | each isClassDefinition 
					and: [each className = aClass name]] ifFound: [:it | ^ eachArtifact] ifNone: []]].
	self fail: 'Class not found'.