accessing
readMappers
	^ Dictionary newFrom: 
		(((SquotMappersMapper new loadMappersFromFileSystem: self subFileSystem)
			select: [:each | each isKindOf: SquotAssetMapper])
			collect: [:each | each path -> each])