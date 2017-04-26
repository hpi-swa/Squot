actions
actionPull
	"Pulls into the active (not the selected!) branch"
	| gitRepository localBranchName remoteName repository remoteRef remoteTrackingHistorian remoteTrackingRef remoteUrl remoteVersion previousVersion |
	repository := self projectSelection repository.
	gitRepository := repository gitRepository.
	localBranchName := self projectSelection loadedHistorian shortName.
	remoteName := gitRepository repository upstreamRemoteOfBranchNamed: localBranchName.
	remoteUrl := gitRepository repository remoteUrl: remoteName.
	remoteRef := gitRepository repository upstreamRefOfBranchNamed: localBranchName.
	(remoteName isNil or: [remoteRef isNil]) ifTrue:
		[self offerToSetUpstreamBranchOf: localBranchName
			in: gitRepository
			ifCanceled: [^ self].
		remoteName := gitRepository repository upstreamRemoteOfBranchNamed: localBranchName.
		remoteUrl := gitRepository repository remoteUrl: remoteName.
		remoteRef := gitRepository repository upstreamRefOfBranchNamed: localBranchName].
	gitRepository fetchFrom: remoteName.
	remoteTrackingRef := gitRepository repository refName: localBranchName forRemote: remoteName.
	remoteTrackingHistorian := repository historianNamed: remoteTrackingRef.
	remoteVersion := remoteTrackingHistorian version.
	previousVersion := self projectSelection loadedHistorian version.
	remoteVersion = previousVersion ifTrue:
		[UIManager default inform: 'Already up-to-date'.
		^ self].
	(previousVersion mergeBaseWith: remoteVersion) = remoteVersion
		ifTrue: ["already merged" ^ self inform:
			'Already up-to-date. Your local branch is ahead of the remote branch'].
	self projectSelection mergeVersionInteractively: remoteVersion.
	(self projectSelection loadedHistorian version = remoteVersion)
		ifTrue: ["fast-forward merge" ^ self refresh].
	[self actionCommit] on: SquotInitialLogMessageRequested
		do: [:request | request resume: 'Merge branch ', remoteTrackingHistorian shortName, ' of ', remoteUrl].
	self refresh.