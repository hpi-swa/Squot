Squit internal
versionForCommit: aGitCommit
	"Answer the (cached?) SquitVersion on aGitCommit"
	aGitCommit ifNil: [^ nil].
	^ (versionsCache at: aGitCommit hexHash
		ifAbsentPut: [self newVersionForCommit: aGitCommit])
		ifNil: [versionsCache at: aGitCommit hexHash put: (self newVersionForCommit: aGitCommit)]