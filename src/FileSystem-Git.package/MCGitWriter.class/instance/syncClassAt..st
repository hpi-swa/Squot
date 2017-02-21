syncing
syncClassAt: directory
	|className|
	className := (directory basename copyUpToLast: $.) asSymbol.
	(Smalltalk includesKey: className)
		ifFalse: [ ^ directory delete ].
	self syncMethodsOfClass: (Smalltalk at: className) in: directory.