*squot
browseFromSquot
	^ ClassListBrowser new
		initForClassesNamed: (self classes collect: [:each | each name])
		title: 'Classes in package ', self packageName