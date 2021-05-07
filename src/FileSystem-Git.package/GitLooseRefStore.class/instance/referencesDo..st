enumerating
referencesDo: aBlock
	"Invoke aBlock with all references (as strings) in this repository.
	References outside of the refsDir will come last."
	| absoluteBaseDir |
	absoluteBaseDir := baseDir asAbsolute.
	(FSSelectVisitor breadthFirst: absoluteBaseDir / 'refs' select: [:each | each isFile])
		do: [:each | aBlock value: (self refFromFile: each reference relativeTo: absoluteBaseDir)].
	absoluteBaseDir children
		select: [:each | each basename allSatisfy: #isUppercase]
		thenDo: [:each | aBlock value: each basename].