accessing
delete
	tempChangesFile ifNotNil:
		[self directory deleteFileNamed: tempChangesFile localName].