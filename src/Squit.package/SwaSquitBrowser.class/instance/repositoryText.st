toolbuilder
repositoryText
	
	^ self selectedRepository
		ifNotNilDo: [:repository | repository asString]
		ifNil: ['No repository selected/cloned']