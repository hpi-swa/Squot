guessing
guessArtifacts
	"Search the files and directories for known patterns that indicate certain types of objects
	stored there."
	| locators search |
	locators := OrderedCollection new.
	(Pragma allNamed: #squotArtifactLocatorFor:priority: from: self class to: self class)
		do: [:each | locators add: (self perform: each selector)].
	search := SquotFileSearchForArtifacts new.
	locators do: [:each | search visit: directory with: each].
	search runSearch.
	^ search artifactsFound