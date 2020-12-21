enumerating
do: aBlock
	walk do:
		[:each |
		each first ~= each second ifTrue:
			[latestWorking := each first.
			latestIncoming := each second.
			latestBase := each third.
			aBlock valueWithArguments: each]].