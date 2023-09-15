initialization
setItem: aString
	super setItem: aString.
	self string: (GitReference shortName: aString).