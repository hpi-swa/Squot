accessing
branchNames
	| found names |
	found := Set new.
	names := OrderedCollection new.
	refStores do: [:eachStore |
		eachStore branchNames do: [:eachBranch |
			(found ifAbsentAdd: eachBranch) ifTrue: [names add: eachBranch]]].
	^ names