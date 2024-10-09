loading
loadAnimatedImageMorph: aStringOrPath
	^ GSAnimationMapper gifReadWriterAsMorph: (self loadGIFReadWriter: aStringOrPath)