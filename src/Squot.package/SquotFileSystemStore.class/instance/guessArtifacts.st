guessing
guessArtifacts
	"Search the files and directories for known patterns that indicate certain types of objects
	stored there."
	| locators search |
	locators := self artifactLocators.
	search := self prepareArtifactSearchWith: locators.
	search runSearch.
	^ search artifactsFound