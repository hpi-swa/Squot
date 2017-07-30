private
follow: aDecoratedObject
	| undecorated |
	undecorated := aDecoratedObject undecorated.
	(visited includes: undecorated) ifTrue: [^ self].
	visited add: undecorated.
	capturedObject := undecorated.
	self capture:
		(replacedObjects
			at: undecorated
			ifAbsent: [aDecoratedObject]).