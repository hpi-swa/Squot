accessing
path: aString
	| oldPath |
	oldPath := path.
	path := aString.
	self flag: #todo.
	"SquotPathChanged is only needed to catch changes made in #validatePath,
	which is deprecated. Remove the signalling and SquotPathChanged when validatePath
	is removed."
	path ~= oldPath & oldPath notNil ifTrue:
		[ (SquotPathChanged previous: oldPath new: aString artifact: self) signal].