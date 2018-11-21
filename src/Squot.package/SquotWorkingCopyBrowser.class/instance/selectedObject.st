toolbuilder
selectedObject
	selectedObjectIndex > 0 ifFalse: [^ nil].
	^ self artifactsList at: selectedObjectIndex