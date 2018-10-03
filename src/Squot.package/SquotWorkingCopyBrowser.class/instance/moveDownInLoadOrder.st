actions
moveDownInLoadOrder
	self isLastArtifactSelected ifTrue: [^ self].
	self editLoadOrder: [:loadOrder |
		loadOrder swap: selectedObjectIndex with: selectedObjectIndex + 1.
		selectedObjectIndex := selectedObjectIndex + 1].