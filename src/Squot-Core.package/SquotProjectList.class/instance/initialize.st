initialize-release
initialize
	super initialize.
	SqueakWorkingCopy addDependent: self. "registry updates"