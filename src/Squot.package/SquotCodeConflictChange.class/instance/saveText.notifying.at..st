ui
saveText: aText notifying: requestor at: aNumber
	(self isResolved and: [self isInEditMode not]) ifTrue: [^ self inform: 'Please enter edit mode first'].
	self resolveTo: (self someDefinition
						squotCopyWithSources: (self sourcesWith: aText asString at: aNumber)
						notifying: requestor
						ifFail: [:message | ^ self inform: 'Error: ', message asString]).