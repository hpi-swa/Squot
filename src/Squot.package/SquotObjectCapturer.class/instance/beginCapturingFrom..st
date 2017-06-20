private
beginCapturingFrom: anObject
	| decorated captured |
	[state := #enumerating.
	toBeVisited removeAll.
	decoratedObjects removeAll.
	objectNameMapping removeAll.
	convertedObjects removeAll.
	decorated := SquotNameDecorator on: (SquotCreatorDecorator on: anObject creator: nil slot: nil) withName: #().
	decoratedObjects at: anObject put: decorated.
	toBeVisited add: decorated.
	self followReferences. "give names to objects"
	state := #capturing.
	captured := self capture: anObject.
	self followReferences. "fill shadows with captured values"
	^ captured]
	ensure: [state := nil. currentObjectName := nil]