accessing
unignore
	content ifNil: [^ self].
	self flag: #todo. "Environment access is specific to packages"
	(PackageInfo squotEnvironmentOf: (workingCopy artifactAt: artifactDiff path))
		beCurrentDuring:
			[content unignoreInSquot].