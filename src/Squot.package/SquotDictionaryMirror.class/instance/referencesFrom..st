enumerating
referencesFrom: aDictionary
	^ aDictionary keys collect: [:each | SquotDictionaryEntry key: each]