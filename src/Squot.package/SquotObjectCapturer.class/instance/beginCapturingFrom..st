private
beginCapturingFrom: anObject
	| decorated nameOfAnObject |
	[objectGraph := SquotMutableObjectGraph new.
	objectGraph delegateRegistry: objectRegistry.
	state := #enumerating.
	toBeVisited removeAll.
	convertedObjects removeAll.
	visited removeAll.
	slotsToConvert removeAll.
	decorated := SquotCreatorDecorator on: anObject creator: nil slot: nil.
	objectGraph nameOf: anObject ifAbsentAssign: [self newNameFor: decorated].
	toBeVisited add: decorated.
	self followReferences. "give names to objects and create shadows"
	state := #capturing.
	visited removeAll.
	toBeVisited add: anObject.
	self convertSlotValues. "redirect slots from live objects to shadows"
	nameOfAnObject := objectGraph nameOf: anObject ifAbsent: [nil].
	objectGraph startShadow: (convertedObjects at: anObject).
	^ objectGraph as: SquotObjectGraph2]
	ensure: [state := nil]