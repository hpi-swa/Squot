actions
setUpstreamBranchOf: aHistorian
	| localBranchName newRemote |
	newRemote := nil.
	localBranchName := aHistorian shortName.
	[self requestAndSetUpstreamBranchOf: aHistorian]
		on: SquitNoRemotes do:
			[:noRemotes |
			self inform: 'No useable remote (http only) found. Please add a remote first, then try again.'.
			Project current addDeferredUIMessage:
				[self actionManageRemotes addRemote]].