enumerating
do: aBlock
	walk do: 
		[:each |
		each first ~= each second ifTrue: 
			[| referrers path |
			referrers := walk currentReferrer.
			path := walk currentPath.
			aBlock
				value: each first
				value: each second
				value: (referrers ifNotNil: [referrers first])
				value: (referrers ifNotNil: [referrers second])
				value: path]].