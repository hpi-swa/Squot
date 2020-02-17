enumerating
referencesDo: aBlock
	"Invoke aBlock with all references (as strings) in this repository.
	References outside of the refsDir will come last."
	| baseDir |
	baseDir := repository baseDir asAbsolute.
	(FSSelectVisitor breadthFirst: baseDir / 'refs' select: [:each | each isFile])
		do: [:each | aBlock value: (self refFromFile: each reference relativeTo: baseDir)].
	baseDir children
		select: [:each | each basename allSatisfy: #isUppercase]
		thenDo: [:each | aBlock value: each basename].