accessing
readMappers
	^ Dictionary newFrom: 
		(((SquotMetadataMapper new loadMappersFromFileSystem: self subFileSystem)
			select: [:each | each isKindOf: SquotAssetMapper])
			collect: [:each | each path -> each])