ui
objectIndex: anIndex
	anIndex > 1 ifFalse: [^ self].
	objectIndex := anIndex.
	self changed: #objectIndex