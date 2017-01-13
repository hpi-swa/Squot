Squit internal
versionForCommit: aGitCommit
	"Answer the (cached?) SquitVersion on aGitCommit"
	self flag: #optimize.
	^ SquitVersion new
		repository: self;
		commit: aGitCommit;
		yourself