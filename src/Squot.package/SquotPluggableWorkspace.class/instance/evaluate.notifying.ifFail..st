evaluation
evaluate: aString notifying: requestor ifFail: aBlock
	^ self class evaluatorClass new
		evaluate: aString
		in: nil
		to: nil
		environment: environment
		notifying: requestor
		ifFail: aBlock
		logged: true