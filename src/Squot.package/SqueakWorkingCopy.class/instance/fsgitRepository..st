accessing
fsgitRepository: aFileSystemGitRepository
	fsgitRepository ifNotNil: [fsgitRepository repository removeDependent: self].
	fsgitRepository := aFileSystemGitRepository.
	fsgitRepository ifNotNil: [fsgitRepository repository addDependent: self].