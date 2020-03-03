printing
balloonText
	| browser |
	browser := self.
	[browser ifNil: [^ nil].
	browser respondsTo: #withUnitOfWork:]
		whileFalse: [browser := browser model].
	^ browser withUnitOfWork: [self summary]