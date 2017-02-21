Pur version
parents
	^ commit parents collect: [:each | repository versionForCommit: each]