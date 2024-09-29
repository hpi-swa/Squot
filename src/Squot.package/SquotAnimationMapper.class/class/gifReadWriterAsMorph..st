conversions
gifReadWriterAsMorph: aGIFReadWriter
	^ AnimatedImageMorph new
		fromGIFReader: aGIFReadWriter;
		yourself