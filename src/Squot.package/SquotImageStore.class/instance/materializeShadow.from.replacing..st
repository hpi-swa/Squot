private materializing
materializeShadow: objectShadow from: anArtifact replacing: anObject
	| loadedObject |
	loadedObject := self materializeShadow: objectShadow like: anObject.
	loadedObject haltIfNil.
	anObject ifNotNil:
		[anObject become: loadedObject.
		^ anObject].
	^ loadedObject