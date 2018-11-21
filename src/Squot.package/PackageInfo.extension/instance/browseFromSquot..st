*Squot-trackable
browseFromSquot: aSquotLiveObject
	| environment |
	environment := aSquotLiveObject storeInfo
		at: #environment
		ifAbsent: [Environment current].
	environment beCurrentDuring:
	[^ ClassListBrowser
		newOnClassesNamed: (self classes collect: [:each | each name])
		label: 'Classes in package ', self packageName]