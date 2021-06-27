enumerating
diffsWithNamesDo: aBlock
	diffs keysAndValuesDo: [:name :diff | aBlock value: diff value: name].