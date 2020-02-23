as yet unclassified
on: aShadow withName: aString
	aString ifNil: [^ aShadow].
	aShadow hasSquotShadowName ifTrue:
		[self assert: aShadow name = aString.
		^ aShadow].
	^ self new
		decorated: aShadow withName: aString;
		yourself