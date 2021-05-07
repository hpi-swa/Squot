enumerating
referencesPrefixedWith: prefixString do: aBlock
	"Evaluate aBlock for all refs that start with prefixString/ (e. g. refs/heads/)."
	accesses add: {#do. prefixString}.
	refs associationsDo: [:each |
		(each name beginsWith: prefixString, '/') ifTrue: [aBlock value: each]].