running
runCase
	GitFeatureFlags warnAboutUseOfDeprecatedMethods ifFalse: [^ super runCase].
	('*UnitOfWork*' match: self class name) ifTrue: [^ super runCase].
	[super runCase]
		on: Warning do:
			[:ex |
			('*unit of work*' match: ex messageText)
				ifTrue: [ex resume]
				ifFalse: [ex pass]].