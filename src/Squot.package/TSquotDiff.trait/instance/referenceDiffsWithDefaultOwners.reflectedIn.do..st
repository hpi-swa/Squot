Squot-diff-enumerating
referenceDiffsWithDefaultOwners: leftAndRightShadows reflectedIn: aMirror do: aBlock
	"If I know how to update the references of my target object, I should answer a collection of SquotReferenceDiffs that describe them. If I do not know my original and changed shadows, I shall use those from leftAndRightShadows to create those reference diffs. If I do not know how to reflect on the shadow of my target object, I shall use aMirror."
	"This method converts object-focused diffs into reference-focused diffs."
	^ #()