actions on branches
actionPushToRemote: aString
	self withUnitOfWork:
	[self pushSelectedHistorianByDoing:
		[selectedHistorian repository
			export: selectedHistorian
			withName: (SquotGUI
							request: 'Branch name at remote:'
							initialAnswer: selectedHistorian shortName)
			toRemoteNamed: aString]].