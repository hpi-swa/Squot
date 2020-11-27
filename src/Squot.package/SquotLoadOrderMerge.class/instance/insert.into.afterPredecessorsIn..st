private
insert: path into: targetOrder afterPredecessorsIn: sourceOrder
	| insertIndex dependencies |
	dependencies := ((sourceOrder copyUpTo: path) intersection: targetOrder) asSet.
	insertIndex := 1.
	[dependencies notEmpty] whileTrue:  
		[dependencies remove: (targetOrder at: insertIndex) ifAbsent: [].
		insertIndex := insertIndex + 1].
	targetOrder add: path beforeIndex: insertIndex.