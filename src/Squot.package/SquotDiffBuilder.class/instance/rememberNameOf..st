private
rememberNameOf: aShadow
	aShadow hasSquotShadowName
		ifTrue: [^ shadowNames at: aShadow undecorated put: aShadow name].
	(left nameOf: aShadow undecorated ifAbsent: [])
		ifNotNil: [:name | ^ shadowNames at: aShadow undecorated put: name].
	(right nameOf: aShadow undecorated ifAbsent: [])
		ifNotNil: [:name | ^ shadowNames at: aShadow undecorated put: name].
	^ nil