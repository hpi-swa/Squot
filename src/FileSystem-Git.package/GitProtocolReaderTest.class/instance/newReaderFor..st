helpers
newReaderFor: aStringOrStream
	^ self targetClass on: aStringOrStream readStream