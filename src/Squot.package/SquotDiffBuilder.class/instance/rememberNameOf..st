private
rememberNameOf: aShadow
	aShadow hasSquotShadowName
		ifTrue: [^ shadowNames at: aShadow undecorated put: aShadow name].
	^ nil