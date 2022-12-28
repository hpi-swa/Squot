reflection
referencesFrom: aProjectSnapshot
	^ artifacts values collect: [:each | each asObjectReference]