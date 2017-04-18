as yet unclassified
addContentForInspectionTo: aStream
	content ifNotNil: [^ aStream nextPut: content].
	children do: [:each | each addContentForInspectionTo: aStream].