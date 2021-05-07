utilities
assertVersion: aVersion containsClass: aClass
	aVersion snapshot artifactsDo: [:eachArtifact |
		((eachArtifact storeInfo at: #objectClassName ifAbsent: ['']) = #PackageInfo)
			ifTrue: [eachArtifact packageArtifactDefinitions
				detect: [:each | each isClassDefinition 
					and: [each className = aClass name]] ifFound: [:it | ^ eachArtifact] ifNone: []].
		((eachArtifact storeInfo at: #objectClassName ifAbsent: ['']) endsWith: ' class')
			ifTrue: [eachArtifact packageArtifactDefinitions
				detect: [:each | each isClassDefinition 
					and: [each className = aClass name]] ifFound: [:it | ^ eachArtifact] ifNone: []]].
	self fail: 'Class not found'.