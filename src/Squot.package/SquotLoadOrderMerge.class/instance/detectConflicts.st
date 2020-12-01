merging
detectConflicts
	| resolution |
	resolution := self resolveLoadOrders.
	resolution second == #conflicts
		ifTrue: [containerConflicts at: #conflicts put: SquotLoadOrderConflict new].