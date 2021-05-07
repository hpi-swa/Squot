private
createRepository
	| repositoryPath |
	directory :=
		directory
			ifNil: [SquotGUI chooseDirectory: 'Repository directory']
			ifNotNil: [SquotGUI chooseDirectory: 'Repository directory' from: directory].
	directory ifNil: [^ nil].
	repositoryPath := directory pathName.
	repository := SquitRepository new initializeInDirectory: (FileSystem disk root resolve: repositoryPath).
	^ repository