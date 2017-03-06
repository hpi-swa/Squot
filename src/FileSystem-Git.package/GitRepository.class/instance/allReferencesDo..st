public-accessing-references
allReferencesDo: aBlock
	"Invoke aBlock with all references (as strings) in this repository.
	References outside of the refsDir will come last."
	| baseDir |
	baseDir := self baseDir asAbsolute.
	(FSSelectVisitor breadthFirst: baseDir / 'refs' select: [:each | each isFile])
		do: [:each | aBlock value: ((each reference relativeTo: baseDir) printWithDelimiter: $/)].
	baseDir children
		select: [:each | each basename allSatisfy: #isUppercase]
		thenDo: [:each | aBlock value: each basename].