public converting
convertRoot: anObject
	rootObject := anObject.
	rootCopy := rootObject copy.
	rootMetaobject := SquotMetaobject new.
	self build: rootMetaobject from: rootObject andItsCopy: rootCopy.
	^ rootMetaobject