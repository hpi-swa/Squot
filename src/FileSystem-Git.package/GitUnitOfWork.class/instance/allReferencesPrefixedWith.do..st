enumerating
allReferencesPrefixedWith: prefixString do: aBlock
	"Invoke aBlock with all references (as strings) starting with prefixString in this repository."
	| visited |
	visited := Set new.
	refStores do: [:eachStore | eachStore referencesPrefixedWith: prefixString do: [:eachRef |
		(visited ifAbsentAdd: eachRef) ifTrue: [aBlock value: eachRef]]].