initialize-release
initialize
	super initialize.
	versionList := OrderedCollection new.
	stopRequested := false.