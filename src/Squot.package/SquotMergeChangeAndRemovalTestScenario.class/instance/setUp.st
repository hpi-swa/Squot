running
setUp
	conflictObject := ValueHolder new contents: 'Base text'; yourself.
	others := OrderedCollection new.
	self repository
		withUnitOfWork: [ 
			baseVersion := self createBaseVersion.
			self prepareIncomingVersion.
			workingCopy saveVersionWithMessage: 'Remove artifact'.
			incomingVersion := workingCopy loadedHistorian version.
			self prepareWorkingVersion.
			workingCopy saveVersionWithMessage: 'Change artifact']