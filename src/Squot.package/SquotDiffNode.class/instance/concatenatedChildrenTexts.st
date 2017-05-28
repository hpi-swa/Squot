as yet unclassified
concatenatedChildrenTexts
	^ self children inject: Text new into: [:text :each |
		each isActive
			ifTrue: [text append: each asStringOrText;
					append: String cr; append: String cr]
			ifFalse: [text]]