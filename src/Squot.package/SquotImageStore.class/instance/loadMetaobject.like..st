private loading
loadMetaobject: metaObject like: anObject
	| loadedObject |
	loadedObject := metaObject materializeLike: anObject onBehalfOf: self.
	^ loadedObject