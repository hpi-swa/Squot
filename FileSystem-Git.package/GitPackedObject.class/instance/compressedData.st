accessing
compressedData
	^ self sourceStream contents 
		copyFrom: self startPosition + 1
		to: self stopPosition