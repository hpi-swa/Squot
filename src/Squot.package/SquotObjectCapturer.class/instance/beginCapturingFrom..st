private
beginCapturingFrom: anObject
	| decorated nameOfAnObject |
	[objectGraph := SquotObjectGraph new.
	objectGraph delegateRegistry: objectRegistry.
	state := #enumerating.
	toBeVisited removeAll.
	convertedObjects removeAll.
	visited removeAll.
	decorated := SquotCreatorDecorator on: anObject creator: nil slot: nil.
	toBeVisited add: decorated.
	self followReferences. "give names to objects"
	state := #capturing.
	visited removeAll.
	toBeVisited add: anObject.
	self followReferences. "fill shadows with captured values"
	nameOfAnObject := objectGraph nameOf: anObject ifAbsent: [nil].
	objectGraph startName: nameOfAnObject.
	^ SquotNameDecorator
		on: (convertedObjects at: anObject)
		withName: nameOfAnObject]
	ensure: [state := nil]