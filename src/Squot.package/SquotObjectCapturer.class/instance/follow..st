private
follow: aDecoratedObject
	| undecorated |
	undecorated := aDecoratedObject undecorated.
	state == #enumerating ifTrue:
		[(visited includes: undecorated) ifTrue: [^ self].
		visited add: undecorated.
		undecorated shouldHaveNameAssignedBySquot
			ifTrue: [objectGraph nameOf: undecorated
					ifAbsentAssign: [self newNameFor: aDecoratedObject]]].
	capturedObject := aDecoratedObject undecorated.
	self capture:
		(replacedObjects
			at: undecorated
			ifAbsent: [aDecoratedObject]).