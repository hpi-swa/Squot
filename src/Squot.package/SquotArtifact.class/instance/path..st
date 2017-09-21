accessing
path: aString
	| oldPath |
	oldPath := path.
	path := aString.
	path ~= oldPath & oldPath notNil ifTrue:
		[ (SquotPathChanged previous: oldPath new: aString artifact: self) signal].