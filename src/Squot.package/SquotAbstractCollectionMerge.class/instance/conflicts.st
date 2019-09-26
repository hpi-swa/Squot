accessing
conflicts
	| collection |
	collection := Set new
		addAll: containerConflicts values;
		yourself.
	self elementMerges do: [:each | collection addAll: each conflicts].
	^ collection