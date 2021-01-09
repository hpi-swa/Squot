enumerating
do: aBlock
	walk do: 
		[:each |
		each first ~= each second ifTrue: 
			[| referrers |
			referrers := walk currentReferrer.
			aBlock
				value: each first
				value: each second
				value: (referrers ifNotNil: [referrers first])
				value: (referrers ifNotNil: [referrers second])]].