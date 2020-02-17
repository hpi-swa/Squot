testing
hasPacks: aGitRepository
	| dir |
	dir := aGitRepository packsDir.
	^ dir exists and: [dir files notEmpty]