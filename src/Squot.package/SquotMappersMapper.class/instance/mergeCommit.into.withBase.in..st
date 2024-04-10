merging
mergeCommit: rightFSCommit into: leftFSCommit withBase: baseFSCommit in: aWorkingCopy
	| emptyCommit commits mappersForCommits commitsForMappers potentiallyRemovedMappers mapperChangeSets mappersChangeSet |
	emptyCommit := aWorkingCopy emptyCommit.
	commits := {rightFSCommit. leftFSCommit. baseFSCommit}.
	mappersForCommits := commits collect: [:each | self loadMappersFromFSCommit: each].
	commitsForMappers := Dictionary new.
	commits withIndexDo: [:commit :index |
		(mappersForCommits at: index) do: [:mapper |
			(commitsForMappers at: mapper ifAbsentPut: [{emptyCommit. emptyCommit. emptyCommit}])
				at: index put: commit]].
	potentiallyRemovedMappers := commitsForMappers keys select: [:mapper | | commitsForMapper |
		commitsForMapper := (commitsForMappers at: mapper).
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
		changeSetFromMappers: mappersForCommits second
		removing: potentiallyRemovedMappers
		changeSets: mapperChangeSets.
	^ mapperChangeSets values copyWith: mappersChangeSet