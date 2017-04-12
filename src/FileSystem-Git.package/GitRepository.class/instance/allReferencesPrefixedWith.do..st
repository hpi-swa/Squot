public-accessing-references
allReferencesPrefixedWith: prefixString do: aBlock
	"Invoke aBlock with all references (as strings) starting with prefixString in this repository."
	| baseDir |
	baseDir := self baseDir asAbsolute.
	(FSSelectVisitor breadthFirst: (baseDir resolve: prefixString) select: [:each | each isFile])
		do: [:each | aBlock value: (self refFromFile: each reference relativeTo: baseDir)].