verification
flushes
	^ accesses count: [:each | each first = #flush]