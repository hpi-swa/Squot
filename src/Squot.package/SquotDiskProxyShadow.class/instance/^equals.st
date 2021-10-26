comparing
= anObject
	"For some reason, DiskProxy does not have comparator methods."
	^ [proxy globalObjectName = anObject proxy globalObjectName
		and: [proxy constructorSelector = anObject proxy constructorSelector
		and: [proxy preSelector = anObject proxy preSelector
		and: [proxy constructorArgs = anObject proxy constructorArgs]]]]
		on: MessageNotUnderstood do:
			[:e | (e receiver == anObject and: [e message selector == #proxy])
					ifTrue: [e return: false] ifFalse: [e pass]]