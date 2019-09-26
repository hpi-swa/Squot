patching
squotApplyTo: anObject
	^ (applyBlock ifNil: [self defaultApplyBlock]) cull: anObject cull: self