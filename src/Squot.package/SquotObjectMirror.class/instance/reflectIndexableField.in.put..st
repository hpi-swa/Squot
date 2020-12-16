reflection
reflectIndexableField: anIndexableField in: anObject put: newValue
	thisContext object: anObject basicAt: anIndexableField index put: newValue.
	^ newValue