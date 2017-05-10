actions
remoteUrlOf: aHistorian
	| gitRepository localBranchName remoteName repository |
	repository := aHistorian repository.
	gitRepository := repository gitRepository.
	localBranchName := aHistorian shortName.
	remoteName := gitRepository repository upstreamRemoteOfBranchNamed: localBranchName.
	^ gitRepository repository remoteUrl: remoteName