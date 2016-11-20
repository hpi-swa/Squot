validation
validate
	| referencedObject |
	isInFilemode ifNil: [ GitInvalidObjectError signal: 'Filemode is required for tree entries.' ].
	entryHash ifNil: [ GitInvalidObjectError signal: 'A valid signature is required for the tree entry to point to.' ].
	referencedObject := repository objectNamed: entryHash asHexHash
		ifAbsent: [ GitInvalidObjectError signal: 'Tree entry object not found in the repository' ].
	isInFilemode ~= (referencedObject typeCode = 'blob')
		ifTrue: [ GitInvalidObjectError signal: 'Tree entry must refer to another object with the correct mode' ].
	entryName ifNil: [ GitInvalidObjectError signal: 'A tree entry requires a name.' ].
	entryName ifEmpty: [ GitInvalidObjectError signal: 'Cannot use empty name for a tree entry.' ].