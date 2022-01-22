node creation
createNodeForClass: aSymbol operationsAndConflicts: aCollection
	| operations classOperationOrConflict contentDummy node |
	operations := self hoistClassDefinition: aCollection.
	classOperationOrConflict := operations
		detect: [:each | each definition isClassDefinition]
		ifNone: 
			["Could be a metaclass, look for corresponding class definition"
			self classDefOperationOrConflictFor: operations].
	contentDummy := SquotPackageDiffClassChanges new
		className: aSymbol;
		classDefinition:
			(classOperationOrConflict
				ifNotNil: [classOperationOrConflict definition] "<-- class removal"
				ifNil: [packageMerge incoming definitions
						detect: [:each | each isClassDefinition and: [each className = aSymbol]]
						ifNone: [self extensionPseudoClassDefinition]]);
		yourself.
	node := SquotDiffNode
		title: aSymbol , (self classSuffix: classOperationOrConflict)
		content: contentDummy
		children:
			((operations collect: [:each | self nodeFor: each])
				sort: [:a :b | a title asString <= b title asString])
		onInclude: []
		onExclude: [].
	contentDummy diffTreeNode: node.
	^ node