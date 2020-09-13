initialize-release
display: aStringOrBlock for: aCollection do: aBlock
	^ (self outputOr: [^ aBlock value: self])
		displayProgress: aStringOrBlock
		for: aCollection
		do: aBlock