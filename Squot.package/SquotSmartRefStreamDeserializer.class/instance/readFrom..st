Squot deserialization
readFrom: aReference
	aReference readStreamDo: [:stream |
		^ (self streamClass on: stream) next]