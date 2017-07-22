private
rememberNameOf: aShadow orAssume: fallbackNameBlock
	^ shadowNames at: aShadow undecorated put:
		(aShadow hasSquotShadowName
			ifTrue: [aShadow name]
			ifFalse: [fallbackNameBlock value])