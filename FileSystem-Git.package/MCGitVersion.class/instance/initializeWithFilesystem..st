initialize-release
initializeWithFilesystem: aGitFilesystem
	super initialize.
	filesystem := aGitFilesystem.
	info := MCGitVersionInfo filesystem: self filesystem.