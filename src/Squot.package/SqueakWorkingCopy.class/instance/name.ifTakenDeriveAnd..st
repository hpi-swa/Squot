accessing
name: aString ifTakenDeriveAnd: aBlock
	self name: aString ifTaken: [ | derived |
		derived := self deriveName: aString.
		aBlock cull: derived].