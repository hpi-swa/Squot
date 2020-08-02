instance creation
historian: aSquitHistorian remote: aGitRemote remoteBranchName: aString
	^ self new
		setHistorian: aSquitHistorian
		remote: aGitRemote
		remoteBranchName: aString;
		yourself