changes-creation
changeSetsFromMetadata: fromMetadata
toMetadata: toMetadata
old: oldBlock
common: commonBlock
new: newBlock
in: aWorkingCopy
	| emptyCommit mapperChangeSets potentiallyRemovedMappers mappersChangeSet metadataChangeSet |
	emptyCommit := aWorkingCopy emptyCommit.
	mapperChangeSets := Dictionary new.
	potentiallyRemovedMappers := fromMetadata mappers difference: toMetadata mappers.
	
	(potentiallyRemovedMappers collect: [:old | old -> [oldBlock value: old value: emptyCommit]]),
	((toMetadata mappers intersection: fromMetadata mappers) collect: [:common | common -> [commonBlock value: common]]),
	((toMetadata mappers difference: fromMetadata mappers) collect: [:new | new -> [newBlock value: new value: emptyCommit]])
		do: [:todo | mapperChangeSets at: todo key put: todo value value]
		displayingProgress: [:todo | 'Gathering changes from {1}' format: {todo key}].

	mappersChangeSet := self
		mappersChangeSetFromMappers: fromMetadata mappers
		removing: potentiallyRemovedMappers
		changeSets: mapperChangeSets.
	metadataChangeSet := self
		metadataChangeSetFrom: fromMetadata
		to: toMetadata
		mappersChangeSet: mappersChangeSet.
	^ mapperChangeSets values copyWith: metadataChangeSet