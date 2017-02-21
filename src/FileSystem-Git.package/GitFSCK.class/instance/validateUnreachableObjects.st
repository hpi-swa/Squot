public-validating
validateUnreachableObjects
	| unreachableCopy reachableCopy |
	unreachable ifEmpty: [ ^ self ].
	
	self collectUnreachableErrors.
	unreachableCopy := unreachable copy.
	reachableCopy := reachable copy.
	self visit: unreachable.
	reachable := reachableCopy.
	unreachable := unreachableCopy.