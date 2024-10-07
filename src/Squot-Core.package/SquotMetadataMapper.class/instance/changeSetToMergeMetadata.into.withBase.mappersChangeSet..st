merging
changeSetToMergeMetadata: rightMetadata into: leftMetadata withBase: baseMetadata mappersChangeSet: aChangeSet
	| nameChangeSet |
	nameChangeSet := self
		changeSetToMergeName: rightMetadata name
		into: leftMetadata name
		withBase: baseMetadata name.
	^ self
		changeSetFromOldMetadata: leftMetadata
		propertyChangeSets: {nameChangeSet. aChangeSet}