accessing
nodeLabel: aNode
	| label |
	label := aNode label.
	^ aNode isExcluded
		ifTrue: [self formatExcludedLabel: label]
		ifFalse: [label]