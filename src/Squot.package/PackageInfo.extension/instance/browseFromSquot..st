*Squot-trackable
browseFromSquot: aSquotLiveObject
	| environment |
	environment := aSquotLiveObject storeInfo
		at: #environment
		ifAbsent: [Environment current].
	environment beCurrentDuring:
	[^ ClassListBrowser new
		initForClassesNamed: (self classes collect: [:each | each name])
		title: 'Classes in package ', self packageName]