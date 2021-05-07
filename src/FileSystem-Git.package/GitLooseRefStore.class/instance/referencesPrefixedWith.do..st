enumerating
referencesPrefixedWith: prefixString do: aBlock
	"Invoke aBlock with all references (as strings) starting with prefixString in this repository."
	^ self allLooseReferencesPrefixedWith: prefixString do: aBlock