*SquotTonel-Core
tonelToggleChangeStampsOfAll: aCollection
	| allTonelProperties hasChangeStampsAlreadyEnabled |
	allTonelProperties := aCollection collect:
		[:each | | packageInfoExt |
		packageInfoExt := SquotPackageInfoExtension of: (PackageInfo named: each packageName).
		packageInfoExt -> packageInfoExt tonelProperties].
	hasChangeStampsAlreadyEnabled := allTonelProperties allSatisfy: [:each | each value at: TonelWriter squeakChangestamp ifAbsent: [false]].
	allTonelProperties do:
		[:each |
		each value at: TonelWriter squeakChangestamp put: hasChangeStampsAlreadyEnabled not.
		each key tonelProperties: each value].
	