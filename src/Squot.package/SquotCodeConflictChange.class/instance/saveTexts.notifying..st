ui
saveTexts: aCollection notifying: requestors
	(self isResolved and: [self isInEditMode not]) ifTrue: [^ self inform: 'Please enter edit mode first'].
	self resolveTo: (self someDefinition
						squotCopyWithSources: aCollection
						notifying: requestors
						ifFail: [:message | ^ self inform: 'Error: ', message asString]).