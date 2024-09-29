loading
loadAnimatedImageMorph: aStringOrPath
	^ SquotAnimationMapper gifReadWriterAsMorph: (self loadGIFReadWriter: aStringOrPath)