sar
fileOutAssetLoaderClass
	^ String streamContents: [:stream | | extensionCategories |
		(GitStandaloneAssetLoader classDependencies
			sorted: [:a :b | b inheritsFrom: a])
			do: [:each | each fileOutOn: stream].
		extensionCategories := GitStandaloneAssetLoader extensionMethodCategoryDependencies.
		self class package externalClasses
			select: [:each | each organization categories includesAnyOf: extensionCategories]
			thenDo: [:class |
				extensionCategories do: [:category |
					class
						fileOutCategory: category
						on: stream
						moveSource: false
						toFile: 0]]]