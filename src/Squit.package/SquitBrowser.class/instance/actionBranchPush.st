actions
actionBranchPush
	| historian branchName repository gitRepository |
	self branchSelection ifNil: [^ self].
	historian := self branchSelection historian.
	branchName := historian name.
	repository := self projectSelection repository.
	gitRepository := repository gitRepository.
	[self projectSelection repository
		exportToUpstream: historian
		ifNone: [
			self offerToSetUpstreamBranchOf: branchName
				in: gitRepository
				ifCanceled: [^ self].
			^ self actionBranchPush "try again"]]
	on: NeedGitCredentials do: [:e | | credentials |
		credentials :=
			self requestAndStoreCredentialsFor: repository
				remoteUrl: e repositoryUrl asString
				ifCanceled: [^ self].
		e resume: credentials]