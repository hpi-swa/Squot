error handling
signalErrorFromReport: aGitReceivePackStatusReport 
	(GitPushFailed asReportedBy: aGitReceivePackStatusReport) signal.