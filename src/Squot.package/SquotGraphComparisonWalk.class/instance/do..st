enumerating
do: aBlock
	walk do: 
		[:each |
		each first ~= each second ifTrue: 
			[| referrers path |
			referrers := walk currentReferrer.
			path := walk currentPath.
			aBlock valueWithArguments:
				{each first.
				each second.
				referrers ifNotNil: [referrers first].
				referrers ifNotNil: [referrers second].
				path}]].