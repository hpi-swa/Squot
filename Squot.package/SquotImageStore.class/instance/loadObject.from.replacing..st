private loading
loadObject: storedObject from: anArtifact replacing: anObject
	| loadedObject |
	self flag: #hack. "could be dangerous!"
	loadedObject := storedObject copy.
	anObject ifNotNil: [anObject becomeForward: loadedObject].
	^ loadedObject