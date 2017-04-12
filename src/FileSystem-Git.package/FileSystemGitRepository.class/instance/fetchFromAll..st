git porcelain
fetchFromAll: aCollectionOfRemoteNames
	aCollectionOfRemoteNames do: [:each | self fetchFrom: each].