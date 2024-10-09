requesting
chooseNewOperationClass
	| classes |
	classes := self compatibleOperationClasses.
	^ (UIManager default
		chooseFrom: (classes collect: #operationName)
		values: classes
		title: 'Choose the new operation type:')
		ifNil: [GSRebaseCancelChangeOperationError signal]