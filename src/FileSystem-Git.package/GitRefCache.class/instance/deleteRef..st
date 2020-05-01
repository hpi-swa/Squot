changing
deleteRef: aString
	| null |
	refs add: (null := GitReference zeroRefWithName: aString).
	resolvedRefs at: aString put: GitReference zeroSignature.
	self changedRef: null.