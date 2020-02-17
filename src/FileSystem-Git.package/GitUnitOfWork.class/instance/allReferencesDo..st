enumerating
allReferencesDo: aBlock
	"Invoke aBlock with all references (as strings) in this repository.
	References outside of the refsDir will come last."
	| visited |
	visited := Set new.
	refStores do: [:eachStore | eachStore referencesDo: [:eachRef |
		(visited ifAbsentAdd: eachRef) ifTrue: [aBlock value: eachRef]]].