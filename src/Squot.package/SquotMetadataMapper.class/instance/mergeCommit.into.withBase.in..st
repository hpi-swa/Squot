merging
mergeCommit: rightFSCommit into: leftFSCommit withBase: baseFSCommit in: aWorkingCopy
	| emptyCommit commits metadataForCommits commitsForMappers potentiallyRemovedMappers mapperChangeSets mappersChangeSet metadataChangeSet |
	emptyCommit := aWorkingCopy emptyCommit.
	commits := {rightFSCommit. leftFSCommit. baseFSCommit}.
	metadataForCommits := commits collect: [:each | self loadMetadataWithUntrackedMappersFromFSCommit: each in: aWorkingCopy].
	commitsForMappers := Dictionary new.
	commits withIndexDo: [:commit :index |
		(metadataForCommits at: index) mappers do: [:mapper |
			(commitsForMappers at: mapper ifAbsentPut: [{emptyCommit. emptyCommit. emptyCommit}])
				at: index put: commit]].
	potentiallyRemovedMappers := commitsForMappers keys select: [:mapper | | commitsForMapper |
		commitsForMapper := commitsForMappers at: mapper.
		commitsForMapper first = emptyCommit or: [commitsForMapper second = emptyCommit]].
	mapperChangeSets := Dictionary new.
	commitsForMappers keysAndValuesDo: [:mapper :mapperCommits |
		mapperChangeSets
			at: mapper
			put: (mapper
					mergeCommit: mapperCommits first
					into: mapperCommits second
					withBase: mapperCommits third)].
	mappersChangeSet := self
		mappersChangeSetFromMappers: metadataForCommits second mappers
		removing: potentiallyRemovedMappers
		changeSets: mapperChangeSets.
	metadataChangeSet := self
		mergeMetadata: metadataForCommits second
		into: metadataForCommits first
		withBase: metadataForCommits third
		mappersChangeSet: mappersChangeSet.
	^ mapperChangeSets values copyWith: metadataChangeSet