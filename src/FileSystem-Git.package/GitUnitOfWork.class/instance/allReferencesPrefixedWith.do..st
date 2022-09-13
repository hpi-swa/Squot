refs
allReferencesPrefixedWith: prefixString do: aBlock
	"Invoke aBlock with all references (as strings) starting with prefixString in this repository."
	((refCache allWithPrefix: prefixString
		ifAbsentPutAll:
			[| visited refs |
			visited := Set new.
			refs := OrderedCollection new.
			refStores do: [:eachStore | eachStore referencesPrefixedWith: prefixString do: [:eachRef |
				(visited ifAbsentAdd: eachRef)
					ifTrue: [refs add: (eachStore ref: eachRef)]]].
			refs])
		collect: [:each | each name]) do: aBlock.