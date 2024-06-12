accessing
readAsset: aPath
	"Ideally, we could use SquotAssetMapper>>loadVersionFrom: here, but that takes a FileSystem
	that is rooted at the repository root. We can't easily provide that, since the asset is stored on
	disk and the disk FileSystem is not rooted at the repository root."
	^ self readStreamOn: aPath do: [:stream | ((self mapperAt: aPath) ifNil: [^ nil]) readVersionFrom: stream]