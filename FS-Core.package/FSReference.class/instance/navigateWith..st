navigating
navigateWith: aBlock
	| newPath |
	newPath := aBlock value.
	^ path == newPath
		ifTrue: [self]
		ifFalse: [filesystem referenceTo: newPath]