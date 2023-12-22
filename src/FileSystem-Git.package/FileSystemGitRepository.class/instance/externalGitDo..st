git porcelain - external
externalGitDo: aCommandLineSuffix
	self externalCommand: ('git -C {1} {2}' format: {repository workingDir pathName copyReplaceAll: ' ' with: '\ '. aCommandLineSuffix}).