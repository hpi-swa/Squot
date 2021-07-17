*Squot-diff-patching
squotApplyToLoaded: sequence
	| patched |
	patched := self diff applyTo: sequence.
	self assert: patched size = sequence size
		description: 'To change the size, object must be replaced by another'.
	self flag: #todo. "The comment above only holds as long as mutable sequenceable collections, such as OrderedCollection, are not captured specially."
	self assert: sequence = file1 description: 'Unfitting diff'.
	sequence replaceFrom: 1 to: sequence size with: patched startingAt: 1.
	^ sequence