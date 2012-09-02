enumerating
packedObjectsDo: aBlock
	| position |
	"First entry is at position 12, after header"
	position := 12.
	objectCount timesRepeat: [ | object |
		object := GitPackedObject
			fromPack: self
			at: position
			in: repository.
		position := position + object packedLength.
		aBlock value: object ]