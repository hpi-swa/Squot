public-accessing-references
allReferencesDo: aBlock
	"Invoke aBlock with all references (as strings) in this repository.
	References outside of the refsDir will come last."
	| baseDir |
	baseDir := self baseDir.
	CollectVisitor breadthFirst: baseDir / 'refs'
		collect: [:each | each isFile
			ifTrue: [aBlock value: ((each reference relativeTo: baseDir) printWithDelimiter: $/)]].
	baseDir children
		select: [:each | each basename allSatisfy: #isUppercase]
		thenDo: [:each | aBlock value: each basename].