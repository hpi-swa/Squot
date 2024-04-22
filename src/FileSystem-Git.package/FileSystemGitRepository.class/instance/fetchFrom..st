git porcelain
fetchFrom: aRemoteName
	^ GitFeatureFlags externalFetchAndPush
		ifTrue: [self fetchAllExternalFrom: aRemoteName]
		ifFalse: [[self fetchInternalFrom: aRemoteName]
					on: ConnectionClosed
					do: [:exception |
						self
							handleConnectionClosed: exception
							whileTryingTo: 'fetch'
							ifRetry: [self fetchFrom: aRemoteName]]].