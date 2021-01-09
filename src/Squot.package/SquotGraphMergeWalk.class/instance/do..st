enumerating
do: aBlock
	walk do:
		[:each |
		each first ~= each second ifTrue:
			[ | referrers |
			latestWorking := each first.
			latestIncoming := each second.
			latestBase := each third.
			referrers := walk currentReferrer.
			aBlock valueWithArguments: each, (referrers ifNotNil: [referrers] ifNil: [#(nil nil nil)])]].