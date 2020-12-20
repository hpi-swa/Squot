enumerating
do: aBlock
	walk do:
		[:each |
		each first ~= each second ifTrue:
			[aBlock valueWithArguments: each]].