moving
moveToAbsolutePathIn: aWorkingCopy
	self path isAbsolute ifTrue: [^ self].
	"can't have any collisions, since the collision check doesn't check for absolute/relative"
	self uncheckedMoveTo: (SquotPathUtilities toAbsolutePath: self path) in: aWorkingCopy.