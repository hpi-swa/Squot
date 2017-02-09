as yet unclassified
verify: aHistorian hasCorrectConversionsUpTo: aMCVersion whichComesFrom: aMCRepository
	historian := aHistorian.
	squotRepository := historian repository.
	monticelloRepository := aMCRepository.
	pendingVersions add: historian version.
	pendingMCVersions add: aMCVersion.
	mcPackage := aMCVersion package.
	[pendingVersions notEmpty]
		whileTrue: [ | nextVersion | nextVersion := pendingVersions removeFirst.
			self verify: nextVersion.
			pendingVersions addAll: nextVersion parents].