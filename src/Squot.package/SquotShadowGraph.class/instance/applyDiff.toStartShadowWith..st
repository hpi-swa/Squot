patching
applyDiff: aDiff toStartShadowWith: aPatcher
	^ startShadow :=
		aPatcher
			apply: aDiff
			to: self startShadow