node creation
createNodeForClass: aSymbol operationsAndConflicts: aCollection
	| operations conflicts nonConflicts classOperationOrConflict contentDummy node |
	operations := self hoistClassDefinition: aCollection.
	classOperationOrConflict := operations
		detect: [:each | each definition isClassDefinition]
		ifNone: 
			["Could be a metaclass, look for corresponding class definition"
			self classDefOperationOrConflictFor: operations].
	conflicts := OrderedCollection new.
	nonConflicts := OrderedCollection new.
	operations do:
		[:each | ((each respondsTo: #isConflict) and: [each isConflict])
					ifTrue: [conflicts add: each]
					ifFalse: [nonConflicts add: each]].
	contentDummy := SquotPackageDiffClassChanges new
		className: aSymbol;
		classDefinition:
			(classOperationOrConflict
				ifNotNil: [classOperationOrConflict definition] "<-- class removal"
				ifNil: [packageMerge incoming definitions
						detect: [:each | each isClassDefinition and: [each className = aSymbol]]
						ifNone: [self extensionPseudoClassDefinition]]);
		operations: nonConflicts;
		conflicts: conflicts;
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