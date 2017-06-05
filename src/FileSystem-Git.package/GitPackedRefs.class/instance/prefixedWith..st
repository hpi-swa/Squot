enumerating
prefixedWith: aString
	^ self refsDictionary associations select: [:each | each name beginsWith: aString]