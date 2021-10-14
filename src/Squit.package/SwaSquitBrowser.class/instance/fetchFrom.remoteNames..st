actions
fetchFrom: aRepository remoteNames: aCollection

	[(SquitInteractiveFetch repository: aRepository 	remoteNames: aCollection)
		fetch]
		on: SquitBadRemote do:
			[:e |
			Project current addDeferredUIMessage: [self error: 'bad remote: ' , e remote].
			e resume].
	self refresh.