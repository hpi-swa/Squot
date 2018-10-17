toolbuilder
dropOnObjectList: anArtifact at: anInteger
	anInteger = 0 ifTrue: [self inform: 'Index 0'. ^ self].
	self editLoadOrder: [:loadOrder |
		loadOrder 
			remove: anArtifact path ifAbsent: [];
			add: anArtifact path beforeIndex: anInteger].