accessing
remoteConfigFor: remoteName option: optionName set: value
	^ self configAt: (repository remoteConfigNameFor: remoteName option: optionName) put: value