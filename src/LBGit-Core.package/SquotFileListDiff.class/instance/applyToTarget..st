applying
applyToTarget: aReference

	self target: aReference.
	self diffs do: [:each | each applyWith: self].