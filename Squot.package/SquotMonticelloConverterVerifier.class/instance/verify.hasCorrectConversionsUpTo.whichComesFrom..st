as yet unclassified
verify: aHistorian hasCorrectConversionsUpTo: aMCVersion whichComesFrom: aMCRepository
	| nVerifiedVersions nVersions |
	historian := aHistorian.
	squotRepository := historian repository.
	monticelloRepository := aMCRepository.
	pendingVersions add: historian version.
	pendingMCVersions add: aMCVersion.
	mcPackage := aMCVersion package.
	nVersions := self countVersions: historian.
	nVerifiedVersions := 0.
	'Verifying ' displaySequentialProgress:
	[[pendingVersions notEmpty]
		whileTrue: [ | nextVersion | nextVersion := pendingVersions removeFirst.
			ProgressNotification signal: (nVerifiedVersions / nVersions) extra: nextVersion asString.
			self verify: nextVersion.
			nVerifiedVersions := nVerifiedVersions + 1]].