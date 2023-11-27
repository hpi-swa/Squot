ui
versionAsMorph: anAnimation
	^ AnimatedImageMorph new
		fromGIFReader: anAnimation asGIFReadWriter
		yourself