accessing
ignore
	content ifNil: [^ self].
	self flag: #todo. "Environment access is specific to packages"
	self withPackageEnvironmentDo: [content ignoreInSquot].