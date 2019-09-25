testing
squotHasConflicts
	"This is implementation begs for an apology..."
	^ self topNodes anySatisfy: [:any | any needsChoice]