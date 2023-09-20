merging
mergeCommit: rightFSCommit into: leftFSCommit withBase: baseFSCommit in: aWorkingCopy
	| emptyCommit commits mappersCollections combinedMappers |
	emptyCommit := aWorkingCopy emptyCommit.
	commits := {rightFSCommit. leftFSCommit. baseFSCommit}.
	mappersCollections := commits collect: [:each | self loadMappersFromFSCommit: each].
	combinedMappers := Dictionary new.
	commits withIndexDo: [:commit :index |
		(mappersCollections at: index) do: [:mapper |
			(combinedMappers at: mapper ifAbsentPut: [{emptyCommit. emptyCommit. emptyCommit}])
				at: index put: commit]].
	^ Array streamContents: [:stream |
		combinedMappers keysAndValuesDo: [:mapper :mapperCommits |
			stream nextPut: (mapper
								mergeCommit: mapperCommits first
								into: mapperCommits second
								withBase: mapperCommits third)].
		stream nextPut:
			(self
				mergeMappers: mappersCollections first
				into: mappersCollections second)]