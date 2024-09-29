accessing
assetFileAt: aPath
	^ self assetFiles at: aPath ifAbsent: [nil]