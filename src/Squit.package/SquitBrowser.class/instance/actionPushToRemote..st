actions on branches
actionPushToRemote: aString
	self pushSelectedHistorianByDoing:
		[selectedHistorian repository
			export: selectedHistorian
			withName: (UIManager default
							request: 'Branch name at remote:'
							initialAnswer: selectedHistorian shortName)
			toRemoteNamed: aString].