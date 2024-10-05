changes-operations
writerOn: aReference
	| writer |
	writer := TonelWriter on: aReference.
	writer packageName: self package name.
	writer currentPackageProperties
		at: TonelWriter squeakChangestamp put: self writeTimestamps.
	writer squotSortPackageProperties.
	^ writer