initialize-release
initialize
	super initialize.
	SquotGitWorkingCopy addDependent: self. "registry updates"