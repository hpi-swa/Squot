initialize-release
gitInitialize
	"This should do roughly the same as the git-init command"
	self exists
		ifTrue: [ ^ self ].
	self ensureGitDirectories.
	self initializeHEAD.