migrations
migrateMaterialized: anObject
	anObject isNil ifTrue: [^ anObject].
	(anObject isKindOf: GSAssetFile) ifTrue: [^ anObject].
	(self isValidAsset: anObject) ifTrue: [ | asset |
		asset := self transformAsset: anObject ifFail: [^ self migrateMaterializedFailed: anObject].
		^ self assetAsAssetFile: asset].
	^ self migrateMaterializedFailed: anObject