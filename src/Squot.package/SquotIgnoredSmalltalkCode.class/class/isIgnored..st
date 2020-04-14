testing
isIgnored: aMCDefinition
	^ (self privateIsWholeClassIgnored: aMCDefinition)
		or: [aMCDefinition squotIsInChangeSet: self changeSet]