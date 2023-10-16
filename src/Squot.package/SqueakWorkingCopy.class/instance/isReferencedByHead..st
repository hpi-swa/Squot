refs
isReferencedByHead: aString
	self unitOfWork followSymbolicRefs: self headRefName do: [:each |
		each = aString ifTrue: [^ true]].
	^ false