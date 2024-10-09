icon
cachedIcon: aBlock cacheKey: aCompiledMethod
	^ self icons
		at: aCompiledMethod
		ifAbsentPut: [| form |
			form := Form extent: 64 asPoint depth: Display depth.
			aBlock value: form getCanvas.
			form]