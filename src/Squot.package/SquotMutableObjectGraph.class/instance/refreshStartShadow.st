patching
refreshStartShadow
	startShadow := self shadowNamed:
		(startShadow hasSquotShadowName
			ifTrue: [startShadow name]
			ifFalse: [self nameOf: startShadow ifAbsent: [^ self]])