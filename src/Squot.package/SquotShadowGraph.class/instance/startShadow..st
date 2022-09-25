accessing
startShadow: aShadow
	| name |
	name := self nameOf: aShadow undecorated ifAbsent: [].
	name
		ifNil: [startShadow := aShadow]
		ifNotNil:
			[startShadow :=
				aShadow hasSquotShadowName
					ifTrue: [self assert: aShadow name = name.
							aShadow]
					ifFalse: [aShadow withSquotObjectName: name]].
	startName := name ifNil: [aShadow hasSquotShadowName ifTrue: [aShadow name]].