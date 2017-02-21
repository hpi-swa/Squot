*FileSystem-Git
peek: anInteger
	| oldPosition result |
	oldPosition := position.
	result := self next: anInteger.
	position := oldPosition.
	^ result