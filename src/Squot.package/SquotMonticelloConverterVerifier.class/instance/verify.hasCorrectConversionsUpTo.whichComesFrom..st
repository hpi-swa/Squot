as yet unclassified
verify: aHistorian hasCorrectConversionsUpTo: aMCVersion whichComesFrom: aMCRepository
	historian := aHistorian.
	squotRepository := historian repository.
	monticelloRepository := aMCRepository.
	pendingVersions add: historian version.
	pendingMCVersions add: aMCVersion.
	mcPackage := aMCVersion package.
	monticelloRepository cacheAllFileNamesDuring:
		[SquotProgress display: 'Verifying ' during:
			[:progress | progress totalSteps: (self countVersions: historian).
			[pendingVersions notEmpty]
				whileTrue: [ | nextVersion | nextVersion := pendingVersions removeFirst.
					progress stepWithText: (nextVersion printStringLimitedTo: 100).
					self verify: nextVersion]]].