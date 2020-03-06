Pur repository
versionAt: aGitHash
	^ self versionForCommit: (self git objectNamed: aGitHash)