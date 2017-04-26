actions
actionPull
	"Pulls into the active (not the selected!) branch"
	| gitRepository localBranchName remoteName repository remoteRef remoteTrackingHistorian remoteTrackingRef remoteUrl remoteVersion |
	repository := self projectSelection repository.
	gitRepository := repository gitRepository.
	localBranchName := self projectSelection loadedHistorian name.
	remoteName := gitRepository repository upstreamRemoteOfBranchNamed: localBranchName.
	remoteUrl := gitRepository repository remoteUrl: remoteName.
	remoteRef := gitRepository repository upstreamRefOfBranchNamed: localBranchName.
	(remoteName isNil or: [remoteRef isNil]) ifTrue:
		[UIManager default inform: 'No upstream branch defined for branch ', localBranchName.
		^ self].
	gitRepository fetchFrom: remoteName.
	remoteTrackingRef := gitRepository repository refName: localBranchName forRemote: remoteName.
	remoteTrackingHistorian := repository historianNamed: remoteTrackingRef.
	remoteVersion := remoteTrackingHistorian version.
	remoteVersion = self projectSelection loadedHistorian version ifTrue:
		[UIManager default inform: 'Already up-to-date'.
		^ self].
	self projectSelection mergeVersionInteractively: remoteVersion.
	(self projectSelection loadedHistorian version = remoteVersion)
		ifTrue: ["fast-forward merge" ^ self refresh].
	[self actionCommit] on: SquotInitialLogMessageRequested
		do: [:request | request resume: 'Merge branch ', remoteTrackingHistorian shortName, ' of ', remoteUrl].
	self refresh.