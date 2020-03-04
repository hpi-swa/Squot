actions
actionPull
	"Pulls into the active (not the selected!) branch"
	| gitRepository localHistorian localBranchName remoteName repository remoteRef remoteTrackingHistorian remoteTrackingRef remoteUrl remoteVersion previousVersion |
	repository := self projectSelection repository.
	repository withUnitOfWork:
	[gitRepository := repository gitRepository.
	localHistorian := self projectSelection loadedHistorian.
	self checkTrackedBranchOrOfferChange: localHistorian
		ifUnsupported: [^ self].
	localBranchName := localHistorian shortName.
	remoteName := localHistorian upstreamRemoteName.
	remoteUrl := gitRepository remoteUrl: remoteName.
	remoteRef := localHistorian upstreamHistorianName.
	(remoteName isNil or: [remoteRef isNil]) ifTrue:
		[self offerToSetUpstreamBranchOf: localBranchName
			in: repository fsgitRepository
			ifCanceled: [^ self].
		remoteName := localHistorian upstreamRemoteName.
		remoteUrl := gitRepository remoteUrl: remoteName.
		remoteRef := localHistorian upstreamHistorianName].
	self withRemoteErrorHandlingDo:
		[self handlingCredentialsOf: localHistorian
			do: [repository importFromUpstream: remoteName]
			ifCanceled: [^ self]].
	remoteTrackingRef := gitRepository refName: remoteRef forRemote: remoteName.
	remoteTrackingHistorian := repository historianNamed: remoteTrackingRef.
	remoteVersion := remoteTrackingHistorian version.
	previousVersion := localHistorian version.
	previousVersion
		ifNil: ["new branch"]
		ifNotNil: [remoteVersion = previousVersion
				ifTrue: [^ self inform: 'Already up-to-date'].
			(previousVersion mergeBaseWith: remoteVersion) = remoteVersion
				ifTrue: ["already merged" ^ self inform:
					'Already up-to-date. Your local branch is ahead of the remote branch']].
	[self mergeVersionIntoActiveBranch: remoteVersion
		ifCanceled: [^ self]]
	on: SquotInitialLogMessageRequested
	do: [:request | request resume:
		'Merge branch ''', (repository historianNamed: remoteRef) shortName,
		''' of ', remoteUrl].
	self selectActiveHistorian].