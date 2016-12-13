ansi gettable
next
	isBinary ifTrue: [^ self basicNext].
	^ self converter nextFromStream: self