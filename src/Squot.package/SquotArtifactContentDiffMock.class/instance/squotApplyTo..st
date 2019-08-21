patching
squotApplyTo: aSquotArtifactContentMock
	^ (applyBlock ifNil: [self defaultApplyBlock]) value: self value: aSquotArtifactContentMock