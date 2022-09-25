accessing
updateResult
	| resolved |
	resolved := self resolveLoadOrders.
	resolved second == #conflicts
		ifFalse: [result := resolved first].