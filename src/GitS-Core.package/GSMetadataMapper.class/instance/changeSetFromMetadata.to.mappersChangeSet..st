changes-creation
changeSetFromMetadata: fromMetadata to: toMetadata mappersChangeSet: aChangeSet
	| nameChangeSet |
	nameChangeSet := self changeSetFromName: fromMetadata name to: toMetadata name.
	^ self
		changeSetFromOldMetadata: fromMetadata
		propertyChangeSets: {nameChangeSet. aChangeSet}