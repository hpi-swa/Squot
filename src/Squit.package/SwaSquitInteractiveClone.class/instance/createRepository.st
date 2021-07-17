as yet unclassified
createRepository
	| repositoryPath |
	directory := (FileDirectory default on: 'squot_repos', FileDirectory slash, name) assureExistence.
	directory ifNil: [^ nil].
	repositoryPath := directory pathName.
	repository := SquitRepository new initializeInDirectory: (FileSystem disk root resolve: repositoryPath).
	^ repository