private
follow: aDecoratedObject
	| undecorated |
	undecorated := aDecoratedObject undecorated.
	state == #enumerating ifTrue:
		[(visited includes: undecorated) ifTrue: [^ self].
		visited add: undecorated.
		objectNameMapping at: undecorated
			ifAbsentPut: [self newNameFor: aDecoratedObject]].
	capturedObject := aDecoratedObject undecorated.
	self capture:
		(replacedObjects
			at: undecorated
			ifAbsent: [aDecoratedObject]).