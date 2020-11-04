private
privateResolvedPatch
	| resolution |
	resolution := self resolveLoadOrders.
	^ resolution second == #conflicts
		ifTrue: [nil]
		ifFalse:
			[GenericDiff squotDiffClass new
				file1: working;
				file2: resolution first;
				diff]