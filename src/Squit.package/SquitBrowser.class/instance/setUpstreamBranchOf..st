actions
setUpstreamBranchOf: aHistorian
	| remoteNameAndRemoteBranchNameOrNil |
	remoteNameAndRemoteBranchNameOrNil :=
	[self requestAndSetUpstreamBranchOf: aHistorian]
		on: SquitNoRemotes do:
			[:noRemotes |
			self inform: 'No useable remote (http only) found. Please add a remote first, then try again.'.
			Project current addDeferredUIMessage:
				[self actionManageRemotes addRemote].
			noRemotes return: nil].
	^ remoteNameAndRemoteBranchNameOrNil