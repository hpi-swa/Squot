converting
rematerialize: aShadow
	^ convertedObjects at: aShadow undecorated
		ifAbsentPut: [aShadow squotMaterializeWith: self]