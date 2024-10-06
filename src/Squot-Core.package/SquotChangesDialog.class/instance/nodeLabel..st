accessing
nodeLabel: aNode
	| label |
	label := aNode label.
	aNode wasEdited ifTrue: [label := self formatEditedLabel: label].
	aNode hasIncludedConflicts ifTrue: [label := self formatLabelWithConflicts: label].
	aNode isExcluded ifTrue: [label := self formatExcludedLabel: label].
	^ label