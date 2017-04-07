converting
build: aMetaobject from: anObject andItsCopy: copyOfAnObject
	convertedObjects at: anObject put: aMetaobject.
	aMetaobject initializeFrom: anObject andItsCopy: copyOfAnObject with: self.