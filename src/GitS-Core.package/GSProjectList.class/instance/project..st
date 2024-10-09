toolbuilder
project: aString
	self workingCopy: (GSGitWorkingCopy named: aString ifAbsent: [nil]).