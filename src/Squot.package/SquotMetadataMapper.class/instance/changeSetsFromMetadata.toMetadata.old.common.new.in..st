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
	'Gathering changes'
		displayProgressFrom: 1
		to: potentiallyRemovedMappers size + toMetadata mappers size
		during: [:bar | | index next |
			index := 1.
			next := [bar value: index. index := index + 1].
			potentiallyRemovedMappers do: [:old |
				mapperChangeSets at: old put: (oldBlock value: old value: emptyCommit). next value].
			(toMetadata mappers intersection: fromMetadata mappers) do: [:common |
				mapperChangeSets at: common put: (commonBlock value: common). next value].
			(toMetadata mappers difference: fromMetadata mappers) do: [:new |
				mapperChangeSets at: new put: (newBlock value: new value: emptyCommit). next value]].
	mappersChangeSet := self
		mappersChangeSetFromMappers: fromMetadata mappers
		removing: potentiallyRemovedMappers
		changeSets: mapperChangeSets.
	metadataChangeSet := self
		metadataChangeSetFrom: fromMetadata
		to: toMetadata
		mappersChangeSet: mappersChangeSet.
	^ mapperChangeSets values copyWith: metadataChangeSet