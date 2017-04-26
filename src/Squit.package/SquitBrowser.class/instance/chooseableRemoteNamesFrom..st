user requests
chooseableRemoteNamesFrom: gitRepository
	^ gitRepository remoteNames select:
		[:each | (gitRepository remoteUrl: each) beginsWith: 'http']