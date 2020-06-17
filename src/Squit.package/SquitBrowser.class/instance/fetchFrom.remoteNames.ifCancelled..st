private
fetchFrom: aRepository remoteNames: aCollection ifCancelled: aBlock
	self withRemoteErrorHandlingDo:
		[self handlingCredentialsOf: aRepository
			do: [aRepository importFromAll: aCollection]
			ifCanceled: [^ aBlock value]]..
	self refresh.