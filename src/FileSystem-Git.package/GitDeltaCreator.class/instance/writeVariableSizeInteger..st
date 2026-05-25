as yet unclassified
writeVariableSizeInteger: anInteger
	| left |
	left := anInteger.
	[left >= 16r80] whileTrue: [
		self write: (left bitOr: 16r80).
		left := left bitShift: -7].
	self write: left.