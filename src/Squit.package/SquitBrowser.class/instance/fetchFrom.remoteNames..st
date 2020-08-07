private
fetchFrom: aRepository remoteNames: aCollection
	[(SquitInteractiveFetch repository: aRepository 	remoteNames: aCollection)
		fetch]
		on: SquitBadRemote do:
			[:e |
			Project current addDeferredUIMessage:
				[self actionManageRemotes
					selectedRemoteName: e remote name].
			e resume].
	self refresh.