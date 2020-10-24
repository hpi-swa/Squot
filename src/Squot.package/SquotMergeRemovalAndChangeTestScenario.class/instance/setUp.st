running
setUp
	| text |
	conflictObject := text := Text fromString: 'Base text'.
	others := OrderedCollection new.
	self repository
		withUnitOfWork: [ 
			baseVersion := self createBaseVersion.
			self prepareIncomingVersion.
			workingCopy saveVersionWithMessage: 'Change artifact'.
			incomingVersion := workingCopy loadedHistorian version.
			self prepareWorkingVersion.
			workingCopy saveVersionWithMessage: 'Remove artifact']