private
follow: aDecoratedObject
	| undecorated |
	undecorated := aDecoratedObject undecorated.
	(convertedObjects includesKey: undecorated) ifTrue: [^ self].
	capturedObject := undecorated.
	self capture:
		(replacedObjects
			at: undecorated
			ifAbsent: [aDecoratedObject]).