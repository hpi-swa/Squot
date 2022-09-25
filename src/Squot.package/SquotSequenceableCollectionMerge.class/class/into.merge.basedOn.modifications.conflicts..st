instance creation
into: workingSequenceableCollection merge: incomingSequenceableCollection basedOn: baseSequenceableCollection modifications: modificationsCollection conflicts: conflictsCollection
	^ self new
		setWorking: workingSequenceableCollection
		incoming: incomingSequenceableCollection
		base: baseSequenceableCollection
		modifications: modificationsCollection
		conflicts: conflictsCollection;
		yourself