operations
parts
	^ (self mapper partsInChanges: self changes)
		do: [:each | each changes: self];
		yourself