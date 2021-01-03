comparing
= anObject
	^ [anObject internalId = self internalId]
		on: MessageNotUnderstood do:
			[:e | e receiver == anObject ifTrue: [^ false] ifFalse: [e pass]]