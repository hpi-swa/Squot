changes-creation
changeSetFromMetadata: fromMetadata to: toMetadata mappersChangeSet: aChangeSet
	| nameChangeSet |
	nameChangeSet := self changeSetFromName: fromMetadata name to: toMetadata name.
	^ self changeSetFromChangeSets: {aChangeSet. nameChangeSet}