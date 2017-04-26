actions
actionBranchPush
	| historian branchName repository gitRepository |
	historian := self branchSelection historian.
	branchName := historian name.
	repository := self projectSelection repository.
	gitRepository := repository gitRepository.
	[self projectSelection repository
		exportToUpstream: historian
		ifNone: [ | remoteName |
			(UIManager default confirm: 'No upstream remote configured for branch ', branchName, '. Would you like to set one?')
				ifFalse: [^ self].
			remoteName := self chooseOneRemoteFrom: gitRepository.
			remoteName ifNil: [^ self].
			gitRepository repository setUpstreamRemoteOfBranchNamed: branchName to: remoteName.
			^ self actionBranchPush "try again"]]
	on: NeedGitCredentials do: [:e | | credentials |
		credentials :=
			self requestAndStoreCredentialsFor: repository
				remoteUrl: e repositoryUrl asString
				ifCanceled: [^ self].
		e resume: credentials]