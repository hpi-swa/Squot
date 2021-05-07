validation
validate
	| referencedObject |
	(#(fileMode dirMode submoduleMode) includes: mode)
		ifFalse: [ GitInvalidObjectError signal: 'Mode is required for tree entries.' ].
	entryHash ifNil: [ GitInvalidObjectError signal: 'A valid signature is required for the tree entry to point to.' ].
	referencedObject := self currentUnitOfWork objectNamed: entryHash asHexHash
		ifAbsent: [ GitInvalidObjectError signal: 'Tree entry object not found in the repository: ', entryName ].
	(mode == #fileMode) ~= (referencedObject typeCode = 'blob')
		ifTrue: [ GitInvalidObjectError signal: 'Tree entry must refer to another object with the correct mode' ].
	(mode == #dirMode) ~= (referencedObject typeCode = 'tree')
		ifTrue: [ GitInvalidObjectError signal: 'Tree entry must refer to another object with the correct mode' ].
	entryName ifNil: [ GitInvalidObjectError signal: 'A tree entry requires a name.' ].
	entryName ifEmpty: [ GitInvalidObjectError signal: 'Cannot use empty name for a tree entry.' ].