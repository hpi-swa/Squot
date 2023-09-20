as yet unclassified
allCompatibleMappersFromStream: aStream
	^ self assetMapperClasses gather: [:each |
		aStream reset.
		each compatibleMappersFromStream: aStream]