private
privateDeprecatedUseUnitOfWork
	(GitFeatureFlags useUnitOfWorkInterface
	and: [GitFeatureFlags warnAboutUseOfDeprecatedMethods
		and: [(thisContext sender sender receiver ~~ self)
			and: [(thisContext sender sender receiver respondsTo: #isTree) not
				or: [thisContext sender sender receiver repository ~~ self]]]]) ifTrue:

		[Deprecation
			signalForContext: thisContext sender
			message: ''
			explanation: 'Use unit of work interface instead'].