sar
fileOutAssetLoaderClass
	^ String streamContents: [:stream |
		(GitStandaloneAssetLoader classDependencies
			sorted: [:a :b | b inheritsFrom: a])
			do: [:each | each fileOutOn: stream]]