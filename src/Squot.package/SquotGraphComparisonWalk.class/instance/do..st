enumerating
do: aBlock
	walk do: [:each |
		each first ~= each second ifTrue:
			[aBlock value: each first value: each second]].