running
handleOperationResult: anObject
	"return whether the next operation should be run immediately"
	anObject isPromise ifTrue: [anObject then: [:result | self handleDelayedOperationResult: result]. ^ false].
	anObject isBlock ifTrue: [self continueBlock: anObject. ^ false].
	anObject = self class nextOperation ifTrue: [self removeNextOperation. ^ true].
	anObject = self class retry ifTrue: [^ true].
	self assert: false descriptionBlock: ['Invalid rebase operation result: {1}' format: {anObject}].