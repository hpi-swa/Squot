as yet unclassified
testDetectGitHubUsername
	| workingCopy remoteUrl |
	workingCopy := self addAndSelectTemporarySquitWorkingCopy.
	self assert: nil equals: (browser detectGitHubUsernameIfNone: []).
	workingCopy repository gitRepository addRemote: 'github' url: (remoteUrl := 'https://github.com/shouldnotexist/shouldnotexist').
	self assert: nil equals: (browser 	detectGitHubUsernameIfNone: []).
	workingCopy repository addCredentialsFor: remoteUrl user: 'mrbean' password: 'robertbennington'.
	self assert: 'mrbean' equals: 
		(browser detectGitHubUsernameIfNone: [self fail: 'There should be a username now']).