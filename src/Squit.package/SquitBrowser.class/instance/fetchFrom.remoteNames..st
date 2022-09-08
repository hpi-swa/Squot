private
fetchFrom: aRepository remoteNames: aCollection
	[(SquitInteractiveFetch repository: aRepository 	remoteNames: aCollection)
		fetch]
		on: SquitBadRemote do:
			[:e |
			Project current addDeferredUIMessage: [self showBadRemote: e remote].
			e resume].
	Project current addDeferredUIMessage: [self refresh].