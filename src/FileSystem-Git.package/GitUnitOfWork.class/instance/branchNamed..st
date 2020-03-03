accessing
branchNamed: aString
	| objectId |
	repository validateReferenceOrReferenceName: aString.
	objectId := self resolveRef: 'refs/heads/', aString.
	objectId ifNil: [^ nil].
	^ self objectNamed: objectId