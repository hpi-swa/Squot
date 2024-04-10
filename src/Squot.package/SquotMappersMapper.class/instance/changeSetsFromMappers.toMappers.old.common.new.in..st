changes-creation
changeSetsFromMappers: fromMappersCollection
toMappers: toMappersCollection
old: oldBlock
common: commonBlock
new: newBlock
in: aWorkingCopy
	| emptyCommit mapperChangeSets potentiallyRemovedMappers mappersChangeSet |
	emptyCommit := aWorkingCopy emptyCommit.
	mapperChangeSets := Dictionary new.
	potentiallyRemovedMappers := fromMappersCollection difference: toMappersCollection.
	potentiallyRemovedMappers do: [:old |
		mapperChangeSets at: old put: (oldBlock value: old value: emptyCommit)].
	(toMappersCollection intersection: fromMappersCollection) do: [:common |
		mapperChangeSets at: common put: (commonBlock value: common)].
	(toMappersCollection difference: fromMappersCollection) do: [:new |
		mapperChangeSets at: new put: (newBlock value: new value: emptyCommit)].
	mappersChangeSet := self
								changeSetFromMappers: fromMappersCollection
								removing: potentiallyRemovedMappers
								changeSets: mapperChangeSets.
	^ mapperChangeSets values copyWith: mappersChangeSet