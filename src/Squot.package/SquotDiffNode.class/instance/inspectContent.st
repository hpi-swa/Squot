as yet unclassified
inspectContent
	content ifNotNil: [^ content explore].
	(Array streamContents: [:stream |
		children do: [:each | each addContentForInspectionTo: stream]]) explore