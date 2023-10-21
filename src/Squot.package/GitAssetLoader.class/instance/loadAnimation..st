loading
loadAnimation: aStringOrPath
	^ AnimatedImageMorph new
		fromGIFReader: (self loadGIFReadWriter: aStringOrPath);
		yourself