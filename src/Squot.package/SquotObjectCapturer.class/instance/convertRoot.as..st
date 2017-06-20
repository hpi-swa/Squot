public converting
convertRoot: anObject as: aMetaobject
	rootObject := anObject.
	rootMetaobject := aMetaobject.
	^ self capture: rootObject as: rootMetaobject