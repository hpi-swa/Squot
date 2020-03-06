private
remoteUrlOf: aHistorian
	| gitRepository localBranchName remoteName repository |
	repository := aHistorian repository.
	gitRepository := repository git.
	localBranchName := aHistorian shortName.
	remoteName := aHistorian upstreamRemoteName.
	^ gitRepository remoteUrl: remoteName