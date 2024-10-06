sar
addAssetLoaderFileLine: aString toSar: aSarBuilder
	| assetsFile |
	assetsFile := self assetLoaderFileInSar: aSarBuilder.
	assetsFile contents: assetsFile contents, String cr, aString.