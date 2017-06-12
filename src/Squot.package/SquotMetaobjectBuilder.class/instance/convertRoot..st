public converting
convertRoot: anObject
	rootObject := anObject.
	rootCopy := rootObject veryDeepCopyUsing: self.
	rootMetaobject := SquotMetaobject new.
	self build: rootMetaobject from: rootObject andItsCopy: rootCopy.
	^ rootMetaobject