enumerating
lazyArtifactsDo: aBlock
	self tableOfContents exists
		ifTrue: [self artifactReferencesDo:
					[:each | aBlock value: (self createLazyArtifactForObjectAt: each)]]
		ifFalse: [self guessArtifacts do: aBlock].