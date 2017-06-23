private
beginCapturingFrom: anObject
	| decorated |
	[state := #enumerating.
	toBeVisited removeAll.
	convertedObjects removeAll.
	visited removeAll.
	decorated := SquotCreatorDecorator on: anObject creator: nil slot: nil.
	toBeVisited add: decorated.
	self followReferences. "give names to objects"
	state := #capturing.
	visited removeAll.
	self follow: anObject.
	self followReferences. "fill shadows with captured values"
	^ SquotNameDecorator
		on: (convertedObjects at: anObject)
		withName: (objectRegistry nameOf: anObject ifAbsent: [nil])]
	ensure: [state := nil]