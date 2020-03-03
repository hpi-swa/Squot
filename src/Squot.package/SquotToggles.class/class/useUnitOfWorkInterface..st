accessing
useUnitOfWorkInterface: aBoolean
	UseUnitOfWorkInterface := aBoolean.
	(self environment valueOf: #GitFeatureFlags ifAbsent: []) ifNotNil:
		[:GitFeatureFlags | GitFeatureFlags useUnitOfWorkInterface: aBoolean].