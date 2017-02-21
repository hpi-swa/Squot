accessing
completeData
	^ self sourceStream contents 
		copyFrom: self startPosition + 1 "+1 because streams start at 0 and strings at 1"
		to: self stopPosition