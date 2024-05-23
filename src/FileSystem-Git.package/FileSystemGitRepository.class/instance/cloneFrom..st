git porcelain
cloneFrom: aStringOrUrl
	GitFeatureFlags externalFetchAndPush
		ifTrue: [self cloneExternalFrom: aStringOrUrl]
		ifFalse: [[self cloneInternalFrom: aStringOrUrl]
					on: ConnectionClosed
					do: [:exception |
						self
							handleConnectionClosed: exception
							whileTryingTo: 'clone'
							ifRetry: [self cloneFrom: aStringOrUrl]]].