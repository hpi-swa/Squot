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
	'Gathering changes'
		displayProgressFrom: 1
		to: potentiallyRemovedMappers size + toMappersCollection size
		during: [:bar | | index next |
			index := 1.
			next := [bar value: index. index := index + 1].
			potentiallyRemovedMappers do: [:old |
				mapperChangeSets at: old put: (oldBlock value: old value: emptyCommit). next value].
			(toMappersCollection intersection: fromMappersCollection) do: [:common |
				mapperChangeSets at: common put: (commonBlock value: common). next value].
			(toMappersCollection difference: fromMappersCollection) do: [:new |
				mapperChangeSets at: new put: (newBlock value: new value: emptyCommit). next value]].
	mappersChangeSet := self
								changeSetFromMappers: fromMappersCollection
								removing: potentiallyRemovedMappers
								changeSets: mapperChangeSets.
	^ mapperChangeSets values copyWith: mappersChangeSet