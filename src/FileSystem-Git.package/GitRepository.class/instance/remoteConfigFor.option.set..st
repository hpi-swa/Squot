deprecated
remoteConfigFor: remoteName option: optionName set: value
	self privateDeprecatedUseUnitOfWork.
	^ self configAt: (self remoteConfigNameFor: remoteName option: optionName) put: value