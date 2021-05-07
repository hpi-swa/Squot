*Squot-Tools
adornedDiffNodeTitle: aString
	"Add adornments based on the state of the diff to the basic title, aString, and answer it."
	^ aString, ' (', self diffNodeOperationTitle, ')'