registering
deriveName: aString
	| current suffix |
	current := aString.
	suffix := 2.
	[self isNameRegistered: current] whileTrue: [
		current := aString, suffix.
		suffix := suffix + 1].
	^ current