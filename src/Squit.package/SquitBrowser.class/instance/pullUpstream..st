actions on branches
pullUpstream: localHistorian
	| gitRepository localBranchName newRemote previousVersion remoteName remoteRef remoteTrackingHistorian remoteTrackingRef remoteUrl remoteVersion repository |
	repository := localHistorian repository.
	gitRepository := repository git.
	[self checkTrackedBranchOrOfferChange: localHistorian
		ifUnsupported: [^ self].
	localBranchName := localHistorian shortName.
	remoteName := localHistorian upstreamRemoteName.
	remoteUrl := gitRepository remoteUrl: remoteName.
	remoteRef := localHistorian upstreamHistorianName.
	(remoteName isNil or: [remoteRef isNil]) ifTrue:
		[(self offerToSetUpstreamBranchOf: localHistorian) ifNil: [^ self].
		remoteName := localHistorian upstreamRemoteName.
		remoteUrl := gitRepository remoteUrl: remoteName.
		remoteRef := localHistorian upstreamHistorianName]]
		on: SquitNoRemotes "no supported remotes available" do:
			[:noRemotes | "add another remote or cancel pull"
			newRemote := self offerToAddRemoteTo: localHistorian repository.
			newRemote ifNil: [^ self] ifNotNil: [noRemotes resume: newRemote]].
	(self fetchFrom: repository remoteNames: {remoteName}) then:
		[:x |
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