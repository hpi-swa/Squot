accessing
artifactAt: path
	^ snapshot
		ifNil: [version artifactAt: path]
		ifNotNil: [snapshot artifactAt: path]