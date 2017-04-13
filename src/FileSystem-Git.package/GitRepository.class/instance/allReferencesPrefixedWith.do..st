public-accessing-references
allReferencesPrefixedWith: prefixString do: aBlock
	"Invoke aBlock with all references (as strings) starting with prefixString in this repository."
	| baseDir prefixDir |
	baseDir := self baseDir asAbsolute.
	prefixDir := baseDir resolve: prefixString.
	prefixDir exists ifFalse: [^ self].
	(FSSelectVisitor breadthFirst: prefixDir select: [:each | each isFile])
		do: [:each | aBlock value: (self refFromFile: each reference relativeTo: baseDir)].