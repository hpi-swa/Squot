testing
isBasedOn: aSquotObjectContainer
	SquotToggles useNewApi ifTrue:
		[^ (aSquotObjectContainer "a SquotProjectSnapshot" project artifactAt: left id) = left].
	^ (aSquotObjectContainer artifactAt: self path) = left