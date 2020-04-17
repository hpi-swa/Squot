deprecated
remoteConfigFor: remoteName option: optionName
	self privateDeprecatedUseUnitOfWork.
	^ self configAt: (self remoteConfigNameFor: remoteName option: optionName)