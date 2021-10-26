private
rememberStartObjectNamesLeft: leftStartShadow right: rightStartShadow
	| fallbackName |
	fallbackName := ({rightStartShadow. leftStartShadow} detect: #hasSquotShadowName ifNone: [])
		ifNotNil: [:shadow | shadow name]
		ifNil: [SquotObjectCapturer new rootName].
	self rememberNameOf: leftStartShadow orAssume: [fallbackName].
	self rememberNameOf: rightStartShadow orAssume: [fallbackName].