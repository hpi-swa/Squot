Squit internal
versionForCommit: aGitCommit
	"Answer the cached SquitVersion on aGitCommit"
	aGitCommit ifNil: [^ nil].
	^ (versionsCache at: aGitCommit
		ifAbsentPut: [self newVersionForCommit: aGitCommit])
		ifNil: [versionsCache at: aGitCommit put: (self newVersionForCommit: aGitCommit)]