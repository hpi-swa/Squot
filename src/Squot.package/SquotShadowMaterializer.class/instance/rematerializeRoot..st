public converting
rematerializeRoot: aMetaobject
	rootObject := aMetaobject createMaterializedInstance.
	rootMetaobject := aMetaobject.
	self rematerialize: rootObject from: rootMetaobject.
	^ rootObject