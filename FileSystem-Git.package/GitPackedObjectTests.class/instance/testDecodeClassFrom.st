tests
testDecodeClassFrom
	| cl |
	cl := GitPackedObject decodeClassFrom: GitPackedObject packedOfsBinaryCode.
	self assert: cl equals: GitPackedOfsDelta.
	cl := GitPackedObject decodeClassFrom: GitPackedObject packedRefsBinaryCode.
	self assert: cl equals: GitPackedRefDelta.
	cl := GitPackedObject decodeClassFrom: 0.
	self assert: cl equals: GitPackedNonDelta.