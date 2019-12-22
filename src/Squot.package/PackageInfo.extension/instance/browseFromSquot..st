*Squot-trackable
browseFromSquot: aSquotLiveObject
	| environment |
	environment := self class squotEnvironmentOf: aSquotLiveObject.
	environment beCurrentDuring:
	[^ ClassListBrowser
		newOnClassesNamed: (self classes collect: [:each | each name])
		label: 'Classes in package ', self packageName]