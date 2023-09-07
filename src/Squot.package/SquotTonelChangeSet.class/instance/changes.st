accessing
changes
	^ self patch operations collect: [:operation |
		SquotTonelChange withChangeSet: self operation: operation]