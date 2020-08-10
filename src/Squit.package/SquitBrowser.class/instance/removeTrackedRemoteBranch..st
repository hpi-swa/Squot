actions on branches
removeTrackedRemoteBranch: aHistorian
	[(SquitInteractiveRemoveUpstreamBranch historian: aHistorian)
		removeRemoteBranch]
		on: SquitBadRemote do:
			[:e |
			Project current addDeferredUIMessage: [self showBadRemote: e remote].
			e resume].
	Project current addDeferredUIMessage: [self refresh]