patching
applyDiff: aDiff toShadowNamed: name with: aPatcher
	^ aPatcher
		apply: aDiff
		to: (SquotNameDecorator on: (self shadowNamed: name
				ifAbsent: [aDiff squotAbsentPrototypeOfRight captureWithSquot])
			withName: name)