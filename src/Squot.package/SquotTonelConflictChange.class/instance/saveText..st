ui
saveText: aText
	(self isResolved and: [self isInEditMode not]) ifTrue: [^ self inform: 'please enter edit mode first'].
	self resolveTo: (self someDefinition squotCopyWithSource: aText asString).