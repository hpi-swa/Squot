validation
validate
	isInFilemode ifNil: [ GitInvalidObjectError signal: 'Filemode is required for tree entries.' ].
	entryHash ifNil: [ GitInvalidObjectError signal: 'A valid signature is required for the tree entry to point to.' ].
	entryName ifNil: [ GitInvalidObjectError signal: 'A tree entry requires a name.' ].
	entryName ifEmpty: [ GitInvalidObjectError signal: 'Cannot use empty name for a tree entry.' ].