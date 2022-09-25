as yet unclassified
doesNotUnderstand: aMessage
	self flag: #todo. "Remove debugging code"
	true "development time" ifTrue: [(self respondsTo: aMessage selector) ifTrue: [^ aMessage sendTo: self]].
	^ aMessage sendTo: workingCopy