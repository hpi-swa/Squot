Pur repository
versionAt: aGitHash
	^ self versionForCommit: (self gitRepository objectNamed: aGitHash)