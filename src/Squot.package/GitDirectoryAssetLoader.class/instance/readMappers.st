accessing
readMappers
	"Ideally, we could use SquotMappersMapper>>loadMappersFromFileSystem: here, but that takes a FileSystem
	that is rooted at the repository root. We can't easily provide that, since the asset is stored on
	disk and the disk FileSystem is not rooted at the repository root."
	^ Dictionary newFrom:
		(((self readStreamOn: SquotMappersMapper path do: [:stream | STON fromStream: stream])
			select: [:each | each isKindOf: SquotAssetMapper])
			collect: [:each | each path -> each])