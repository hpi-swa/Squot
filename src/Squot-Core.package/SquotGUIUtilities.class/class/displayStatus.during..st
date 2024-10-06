progress
displayStatus: aString during: aBlock
	| result |
	UIManager default informUser: aString during: [result := aBlock value].
	^ result