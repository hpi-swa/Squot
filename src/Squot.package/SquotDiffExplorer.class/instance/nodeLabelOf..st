ui diff tree
nodeLabelOf: aSquotDiffNode 
	| title |
	title := aSquotDiffNode title.
	^ aSquotDiffNode anyChildNeedsChoice
		ifTrue: [(Text fromString: title) allBold; yourself]
		ifFalse: [title]