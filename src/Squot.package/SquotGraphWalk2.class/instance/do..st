enumerating
do: aBlock
	[self atEnd] whileFalse: [aBlock value: self next].