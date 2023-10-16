changes-operations
writerOn: aFileSystem
	| writer |
	writer := TonelWriter on: (aFileSystem referenceTo: self path).
	writer packageName: self package name.
	writer currentPackageProperties
		at: TonelWriter squeakChangestamp put: self writeTimestamps.
	^ writer