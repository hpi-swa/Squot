private
follow: aDecoratedObject
	| undecorated |
	undecorated := aDecoratedObject undecorated.
	state == #enumerating ifTrue:
		[(visited includes: undecorated) ifTrue: [^ self].
		visited add: undecorated].
	capturedObject := undecorated.
	self capture:
		(replacedObjects
			at: undecorated
			ifAbsent: [aDecoratedObject]).