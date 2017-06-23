as yet unclassified
on: aShadow withName: aString
	aString ifNil: [^ aShadow].
	^ self new
		decorated: aShadow withName: aString;
		yourself