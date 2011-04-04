navigating
resolveString: aString 
	| filesystem thePath |
	filesystem := (Resolver resolve: origin) filesystem.
	thePath := filesystem pathFromString: aString.
	^ self withPath: (path resolvePath: thePath)