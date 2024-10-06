changes-creation
metadataChangeSetFrom: fromMetadata to: toMetadata mappersChangeSet: aChangeSet
	| nameChangeSet |
	nameChangeSet := self nameChangeSetFrom: fromMetadata name to: toMetadata name.
	^ self
		metadataChangeSetFromOldMetadata: fromMetadata
		propertyChangeSets: {nameChangeSet. aChangeSet}