accessing
deriveName: aString
	| derived |
	derived := self class deriveName: aString.
	self name: derived.
	^ derived