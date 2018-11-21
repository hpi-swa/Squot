comparing
hash
	^ ((self areDestructiveUpdatesAllowed hash bitXor:
		self leftRefPattern hash) hashMultiply bitXor:
		self rightRefPattern hash) hashMultiply