*Squot-diff-patching
squotApplyToLoaded: sequence
	| patched |
	patched := self diff applyTo: sequence.
	self assert: patched size = sequence size
		description: 'To change the size, object must be replaced by another'.
	sequence replaceFrom: 1 to: sequence size with: patched startingAt: 1.
	^ sequence