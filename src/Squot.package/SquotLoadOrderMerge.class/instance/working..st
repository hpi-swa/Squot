accessing
working: anObject

	super working: anObject.
	result := OrderedCollection newFrom: working.