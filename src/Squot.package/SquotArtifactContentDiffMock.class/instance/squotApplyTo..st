patching
squotApplyTo: aSquotArtifactContentMock
	applyBlock ifNil: [^ SquotArtifactContentMock new].
	^ applyBlock value: self value: aSquotArtifactContentMock