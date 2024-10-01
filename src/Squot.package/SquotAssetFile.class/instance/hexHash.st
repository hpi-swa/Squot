comparing
hexHash
	^ hexHash ifNil: [hexHash := self computeHexHash]