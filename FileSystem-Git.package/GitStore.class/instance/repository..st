initialize-release
repository: aGitRepository
	repository := aGitRepository.
	modManager repository: repository.
	revision ifNil: [ self revision: (repository headIfAbsent: [ nil ]) ].