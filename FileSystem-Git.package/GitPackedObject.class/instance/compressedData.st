accessing
compressedData
	^ self sourceStream contents 
		copyFrom: self dataStartPosition + 1 
		to: self sourceStream size