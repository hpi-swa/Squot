comparing
= anObject
	^ [commit = anObject commit]
		on: MessageNotUnderstood do:
			[:e | e receiver == anObject ifTrue: [^ false] ifFalse: [e pass]]