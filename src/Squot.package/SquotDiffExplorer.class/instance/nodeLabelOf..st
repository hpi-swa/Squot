ui diff tree
nodeLabelOf: aSquotDiffNode 
	| title |
	title := aSquotDiffNode title.
	^ aSquotDiffNode anyChildNeedsChoice
		ifTrue: [title asText allBold; yourself]
		ifFalse: [title]