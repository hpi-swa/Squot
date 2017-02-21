initialize release
initializeWithFilesystem: aGitFS commit: aGitCommit
	"Don't do super initialize and keep the instVars niled out for lazy initialization".
	filesystem := aGitFS.
	commit := aGitCommit.
	self loadBasicProperties.
	