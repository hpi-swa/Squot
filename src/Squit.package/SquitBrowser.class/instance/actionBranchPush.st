actions
actionBranchPush
	| historian branchName repository gitRepository |
	self branchSelection ifNil: [^ self].
	historian := self branchSelection historian.
	branchName := historian name.
	repository := self projectSelection repository.
	gitRepository := repository gitRepository.
	self checkTrackedBranchOrOfferChange: historian ifUnsupported: [^ self].
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
	on: GitRemoteAuthenticationFailed do: [:e | | message |
		message := 'Authentication with the remote failed. Please check your credentials.'.
		((self remoteUrlOf: historian) includesSubstring: 'github.com')
			ifTrue: [message := message, ' If you have two-factor authentification enabled, you must use a personal access token instead of your GitHub login password.'].
		self inform: message]
	on: GitNonFastForwardPushUpdatesDetected do: [:e |
		(self confirm: 'Warning: the tip of your branch is behind its remote counterpart. Do you want to force the push anyway?')
			ifTrue: [e proceedWithForcedPush]
			ifFalse: [^ self]].