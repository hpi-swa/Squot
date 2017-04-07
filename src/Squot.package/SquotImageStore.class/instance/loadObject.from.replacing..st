private materializing
loadObject: storedObject from: anArtifact replacing: anObject
	| loadedObject |
	self break.
	self flag: #hack. "could be dangerous!"
	loadedObject := storedObject copy.
	loadedObject haltIfNil.
	anObject ifNotNil: [anObject becomeForward: loadedObject].
	^ loadedObject