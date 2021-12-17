private
createRepository
	directory :=
		directory
			ifNil: [SquotGUI chooseDirectory: 'Repository directory']
			ifNotNil: [SquotGUI chooseDirectory: 'Repository directory' from: directory].
	directory ifNil: [^ nil].
	directory := FileSystem disk root resolve: directory pathName.
	self checkDirectory: directory ifNotEmpty:
		[(SquotGUI confirm: 'Directory is not empty. Really clone to this directory?')
			ifFalse: [^ nil]].
	repository := SquitRepository new initializeInDirectory: directory.
	^ repository