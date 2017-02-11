as yet unclassified
verify: aHistorian hasCorrectConversionsUpTo: aMCVersion whichComesFrom: aMCRepository
	historian := aHistorian.
	squotRepository := historian repository.
	monticelloRepository := aMCRepository.
	pendingVersions add: historian version.
	pendingMCVersions add: aMCVersion.
	mcPackage := aMCVersion package.
	'Verifying versions... ' displaySequentialProgress:
	[[pendingVersions notEmpty]
		whileTrue: [ | nextVersion | nextVersion := pendingVersions removeFirst.
			ProgressNotification signal: 0.5 extra: nextVersion asString.
			self verify: nextVersion]].