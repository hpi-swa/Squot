applying
applyToContainer: anObjectContainer

	self target: ((anObjectContainer class canUnderstand: #directory)
		ifTrue: [anObjectContainer directory]
		ifFalse: [self workingDirectory]).
		
	self diffs do: [:each | each applyWith: self].