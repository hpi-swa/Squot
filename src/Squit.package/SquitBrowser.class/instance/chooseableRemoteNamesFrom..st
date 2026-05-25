user requests
chooseableRemoteNamesFrom: gitRepository
	GitFeatureFlags externalFetchAndPush ifTrue: [^ gitRepository remoteNames].
	^ gitRepository remoteNames select:
		[:each | (gitRepository remoteUrl: each) beginsWith: 'http']