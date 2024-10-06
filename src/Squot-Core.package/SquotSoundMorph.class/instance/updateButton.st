geometry
updateButton
	| rectangle |
	rectangle := self layoutBounds.
	self button setVertices:
		(self isPlaying
			ifFalse: [{rectangle topLeft. rectangle rightCenter. rectangle bottomLeft}]
			ifTrue: [rectangle corners]).