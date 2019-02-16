private
remoteUrlOf: aHistorian
	| gitRepository localBranchName remoteName repository |
	repository := aHistorian repository.
	gitRepository := repository gitRepository.
	localBranchName := aHistorian shortName.
	remoteName := aHistorian upstreamRemoteName.
	^ gitRepository repository remoteUrl: remoteName