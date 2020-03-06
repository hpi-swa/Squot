actions on objects
actionObjectCheckout
	self withUnitOfWork:
	[self projectSelection
		loadArtifactInteractively: self objectSelection artifact
		ifCanceled: [^self]].