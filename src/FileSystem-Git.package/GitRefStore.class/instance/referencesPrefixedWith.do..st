enumerating
referencesPrefixedWith: prefixString do: aBlock
	"Evaluate aBlock for all refs that start with prefixString/ (e. g. refs/heads/)."
	^ self subclassResponsibility