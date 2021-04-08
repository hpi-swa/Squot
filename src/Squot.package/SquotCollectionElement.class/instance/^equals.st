comparing
= anObject
	"Answer whether the receiver and anObject represent the same object."

	self == anObject
		ifTrue: [^ true].
	[anObject target] on: MessageNotUnderstood do:
		[:e | (e message selector == #target and: [e message receiver == anObject])
				ifTrue: [^ false]
				ifFalse: [e pass]].
	^ self target hasSquotShadowName
		ifTrue: [anObject target hasSquotShadowName and: [self target name = anObject target name]]
		ifFalse: [self target = anObject target].