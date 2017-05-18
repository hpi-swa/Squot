accessing-references
headRef
	| head |
	head := self headFile readStreamDo: [:stream | stream contents asString].
	^ (head beginsWith: 'ref:')
		ifTrue: [self expandRef: (head allButFirst: 4) withBlanksTrimmed]
		ifFalse: [head withBlanksTrimmed]