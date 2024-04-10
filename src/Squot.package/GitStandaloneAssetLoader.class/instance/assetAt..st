accessing
assetAt: aPath
	^ self assets at: aPath ifAbsent: [nil]