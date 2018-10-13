enumerating
artifactsInLoadOrderDo: aBlock
	loadOrder do: [:eachPath | aBlock value: (artifacts at: eachPath)].