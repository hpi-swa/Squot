initialize-release
revision: aGitCommit
	revision := aGitCommit.
	revision ifNil: [ ^ self ].
	repository ifNil: [ repository := aGitCommit repository ].
	self flag: 'TODO: directly use the commit as a reference'.
	self basicReset.