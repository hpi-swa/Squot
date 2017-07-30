private
beginCapturingFrom: anObject
	| decorated |
	[objectGraph := SquotMutableObjectGraph new.
	objectGraph delegateRegistry: objectRegistry.
	state := #enumerating.
	toBeVisited removeAll.
	convertedObjects removeAll.
	visited removeAll.
	slotsToConvert removeAll.
	decorated := SquotCreatorDecorator on: anObject creator: nil slot: nil.
	anObject shouldHaveNameAssignedBySquot
		ifTrue: [objectGraph assign: (objectRegistry nameOf: anObject ifAbsent: [self newNameFor: decorated]) to: anObject]
		ifFalse: [objectGraph assign: objectGraph class anonymousObjectName to: anObject].
	toBeVisited add: decorated.
	self followReferences. "give names to objects and create shadows"
	state := nil.
	self convertSlotValues. "redirect slots from live objects to shadows"
	objectGraph startShadow: (convertedObjects at: anObject).
	^ objectGraph as: SquotObjectGraph2]
	ensure: [state := nil]