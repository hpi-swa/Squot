instance creation
into: workingMetadata merge: incomingMetadata basedOn: baseMetadata diffs: diffsDictionary conflicts: conflictsDictionary
	^ self new
		setWorking: workingMetadata incoming: incomingMetadata base: baseMetadata diffs: diffsDictionary conflicts: conflictsDictionary;
		yourself