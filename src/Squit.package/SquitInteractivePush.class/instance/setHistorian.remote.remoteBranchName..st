initialize-release
setHistorian: aSquitHistorian remote: aGitRemote remoteBranchName: aString
	self localHistorian: aSquitHistorian.
	remote := aGitRemote.
	remoteBranchName := aString.