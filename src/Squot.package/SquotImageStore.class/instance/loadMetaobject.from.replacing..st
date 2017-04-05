private loading
loadMetaobject: metaObject from: anArtifact replacing: anObject
	| loadedObject |
	loadedObject := self loadMetaobject: metaObject like: anObject.
	loadedObject haltIfNil.
	anObject ifNotNil:
		[anObject become: loadedObject.
		^ anObject].
	^ loadedObject