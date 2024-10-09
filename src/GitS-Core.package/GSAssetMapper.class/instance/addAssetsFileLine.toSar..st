sar
addAssetsFileLine: aString toSar: aSarBuilder
	| assetsFile |
	assetsFile := self assetsFileInSar: aSarBuilder.
	assetsFile contents: assetsFile contents, String cr, aString.