public-testing
size
	| total |
	total := 0.
	self entries do: [:each | total := total + (each size)].
	^total