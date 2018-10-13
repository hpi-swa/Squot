toolbuilder
dropOnObjectList: anArtifact at: anInteger
	anInteger = 0 ifTrue: [self inform: 'Index 0'. ^ self].
	self editLoadOrder: [:loadOrder |
		loadOrder 
			remove: anArtifact ifAbsent: [];
			add: anArtifact beforeIndex: anInteger].