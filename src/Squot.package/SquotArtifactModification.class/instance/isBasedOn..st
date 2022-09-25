testing
isBasedOn: aSquotObjectContainer
	^ SquotToggles useNewApi
		ifTrue: [(aSquotObjectContainer artifactAt: left artifact id) = left artifact]
		ifFalse: [(aSquotObjectContainer artifactAt: self path) = left]