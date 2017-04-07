private materializing
materializeMetaobject: metaObject from: anArtifact replacing: anObject
	| loadedObject |
	loadedObject := self materializeMetaobject: metaObject like: anObject.
	loadedObject haltIfNil.
	anObject ifNotNil:
		[anObject become: loadedObject.
		^ anObject].
	^ loadedObject