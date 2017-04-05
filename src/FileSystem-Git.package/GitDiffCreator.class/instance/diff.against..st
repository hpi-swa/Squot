private diff creation
diff: leftObject against: rightObject
	leftObject hash = rightObject hash ifTrue: [^ Dictionary new].
	nextRightObject := rightObject.
	^ leftObject diffAgainst: rightObject with: self