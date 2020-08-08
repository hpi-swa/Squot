private
privateDeprecatedUseUnitOfWork
	(GitFeatureFlags warnAboutUseOfDeprecatedMethods) ifTrue:

		[Deprecation
			signalForContext: thisContext sender
			message: ''
			explanation: 'Use unit of work interface instead'].