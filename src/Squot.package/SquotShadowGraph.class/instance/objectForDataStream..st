objects from disk
objectForDataStream: aDataStream
	"Do not serialize the delegate registry, which does not really belong to the graph itself but is used as a fallback to look up objects and their names."
	| copy |
	copy := self copy
		delegateRegistry: nil;
		yourself.
	aDataStream replace: self with: copy.
	^ copy