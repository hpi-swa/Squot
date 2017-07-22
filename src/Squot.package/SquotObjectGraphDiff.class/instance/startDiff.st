accessing
startDiff
	^ diffs ifEmpty: []
		ifNotEmpty:
			[diffs at:
				(startObjectName ifNil:
					[^ diffs size = 1
						ifTrue: [diffs anyOne]
						ifFalse: [self error: 'Cannot identify top diff']])]