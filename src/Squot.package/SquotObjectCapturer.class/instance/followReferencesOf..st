private
followReferencesOf: aDecoratedObject
	| undecorated |
	undecorated := aDecoratedObject undecorated.
	(convertedObjects includesKey: undecorated) ifTrue: [^ self].
	capturedObject := undecorated.
	capturedObjectWithReferrer := aDecoratedObject.
	self capture:
		(replacedObjects
			at: undecorated
			ifAbsent: [aDecoratedObject]).