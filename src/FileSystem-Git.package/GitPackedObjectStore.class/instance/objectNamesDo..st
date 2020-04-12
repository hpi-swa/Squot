enumerating
objectNamesDo: aBlock
	self packs do: [:eachPack | eachPack packedObjectsDo: [:eachObject |
			aBlock value: eachObject hexHash]].