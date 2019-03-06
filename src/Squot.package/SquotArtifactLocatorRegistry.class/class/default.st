accessing
default
	^ Default ifNil:
		[SquotArtifactLocatorRegistry initialize.
		Default]