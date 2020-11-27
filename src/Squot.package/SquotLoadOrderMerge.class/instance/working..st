accessing
working: anObject

	super working: anObject.
	editedWorking := OrderedCollection newFrom: working.