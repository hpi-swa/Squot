directory tree
subDirectoriesOf: aDirectory
	"provide a list of subdirectory names sorted alphnum-no-case"

	| directories |
	directories := super subDirectoriesOf: aDirectory.
	aDirectory = workingCopyDirectory ifTrue:
		[directories := self excludeGitRepositoryDirectory: workingCopyDirectory / '.git' from: directories].
	^ directories