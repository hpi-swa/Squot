instance creation
on: anObject creator: creatorObject slot: slot
	^ self new
		decorated: anObject withCreator: creatorObject slot: slot;
		yourself