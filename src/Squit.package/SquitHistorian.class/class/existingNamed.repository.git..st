instance creation
existingNamed: aString repository: aSquitRepository git: aGitRepository
	"Answer a new historian without validating the reference name because it is supposed to already exist in the repository."
	^ self new
		setName: aString repository: aSquitRepository git: aGitRepository;
		yourself