git porcelain
fetchFromAll: aCollectionOfRemoteNames
	GitFeatureFlags externalFetchAndPush
		ifTrue: [aCollectionOfRemoteNames do: [:each | self fetchAllExternalFrom: each]]
		ifFalse: [aCollectionOfRemoteNames do: [:each | self fetchFrom: each]]