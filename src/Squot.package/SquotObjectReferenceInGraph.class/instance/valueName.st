accessing
valueName
	valueName ifNil: [valueName := graph nameOf: decoratedObject ifAbsent: []].
	^ valueName