loading
loadAncestors
	^ commit parents collect: [ :aGitCommit|
		self class filesystem: filesystem commit: aGitCommit ]