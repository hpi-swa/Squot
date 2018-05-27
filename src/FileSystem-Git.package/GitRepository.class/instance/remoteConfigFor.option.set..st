public-configuration
remoteConfigFor: remoteName option: optionName set: value
	^ self configAt: (self remoteConfigNameFor: remoteName option: optionName) put: value