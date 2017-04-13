history walking
excludeAncestorsOf: aCommit
	GitHistoryWalker new
		walkWhile: [:commit |
			(sinkCommits includes: commit)
				ifTrue: [false]
				ifFalse: [sinkCommits add: commit. true]]
		startingFrom: aCommit