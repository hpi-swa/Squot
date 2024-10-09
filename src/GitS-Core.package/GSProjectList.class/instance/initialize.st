initialize-release
initialize
	super initialize.
	GSGitWorkingCopy addDependent: self. "registry updates"