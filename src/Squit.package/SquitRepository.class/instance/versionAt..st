Pur repository
versionAt: aGitHash
	^ self versionForCommit: (gitRepository repository objectNamed: aGitHash)