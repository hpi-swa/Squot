loading
loadAnimatedImageMorph: aStringOrPath
	^ AnimatedImageMorph new
		fromGIFReader: (self loadGIFReadWriter: aStringOrPath);
		yourself