utilities
assertVersion: aVersion containsClass: aClass
	SquotToggles useNewApi ifTrue:
		[| snapshot |
		snapshot := aVersion snapshot.
		snapshot artifactsDo: [:eachArtifact |
			((eachArtifact storeInfo hasReferenceOfType: 'package') or: [eachArtifact storeInfo hasReferenceOfType: 'class']) ifTrue:
				[(snapshot snapshotArtifact: eachArtifact) objectSnapshot startShadow definitions
					detect: [:each | each isClassDefinition and: [each className = aClass name]]
					ifFound: [:it | ^ eachArtifact]
					ifNone: []]].
		^ self fail: 'Class not found'].
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