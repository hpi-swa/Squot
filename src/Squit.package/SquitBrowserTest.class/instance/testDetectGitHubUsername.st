as yet unclassified
testDetectGitHubUsername
	| workingCopy remoteUrl |
	workingCopy := self addAndSelectTemporarySquitWorkingCopy.
	browser withUnitOfWork:
	[self assert: nil equals: (browser detectGitHubUsernameIfNone: []).
	workingCopy repository fsgitRepository addRemote: 'github' url: (remoteUrl := 'https://github.com/shouldnotexist/shouldnotexist').
	self assert: nil equals: (browser 	detectGitHubUsernameIfNone: []).
	workingCopy repository addCredentialsFor: remoteUrl user: 'mrbean' password: 'robertbennington'.
	self assert: 'mrbean' equals: 
		(browser detectGitHubUsernameIfNone: [self fail: 'There should be a username now'])].