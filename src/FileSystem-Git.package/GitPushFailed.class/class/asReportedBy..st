instance creation
asReportedBy: aGitReceivePackStatusReport 
	^ self new
		setReport: aGitReceivePackStatusReport
		messageText: aGitReceivePackStatusReport asString;
		yourself