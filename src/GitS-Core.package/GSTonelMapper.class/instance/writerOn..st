changes-operations
writerOn: aReference
	| writer |
	writer := TonelWriter on: aReference parent.
	writer packageName: self package name.
	writer currentPackageProperties
		at: TonelWriter squeakChangestamp put: self writeTimestamps.
	writer gitSSortPackageProperties.
	^ writer