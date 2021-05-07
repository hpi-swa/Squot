patching
applyDiff: aDiff toObjectAt: path
	| existing patched |
	existing := artifacts at: path ifAbsentPut: [^ aDiff right].
	patched := existing copyWithDiffApplied: aDiff.
	^ artifacts at: path put: patched