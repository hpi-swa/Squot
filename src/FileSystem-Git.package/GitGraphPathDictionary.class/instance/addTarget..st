as yet unclassified
addTarget: aCommit
	"paths stores one dictionary for each target commit,
	each of the dictionaries stores the paths to this commit"
	paths at: aCommit put: Dictionary new.
	(paths at: aCommit) at: aCommit put: #().