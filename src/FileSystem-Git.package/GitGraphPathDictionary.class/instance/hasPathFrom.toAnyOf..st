as yet unclassified
hasPathFrom: aCommit toAnyOf: targetCommits
	^ targetCommits anySatisfy: [:any | self hasPathFrom: aCommit to: any]