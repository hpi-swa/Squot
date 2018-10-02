accessing
maxIndex
	^ {chunk key offset + chunk key length - 1.
		chunk value offset + chunk value length - 1} max.