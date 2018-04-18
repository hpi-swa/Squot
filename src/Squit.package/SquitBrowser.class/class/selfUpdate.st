updating
selfUpdate
	"SquitBrowser selfUpdate"
	"UpdateWorkingCopy := nil"
	SquotWorkingCopy registered
		detect: [:each | | gitRepository |
			(each repository respondsTo: #gitRepository)
			and: [(gitRepository := each repository gitRepository) remoteNames
					anySatisfy: [:remote | (gitRepository remoteUrl: remote) = self selfUpdateRepository]]]
		ifFound: [:ownWorkingCopy |
			"This is likely to be a Squot developer, so interactively load current version"
			self selfUpdateWithSquot: ownWorkingCopy]
		ifNone: 	[self selfUpdateFromMetacello].