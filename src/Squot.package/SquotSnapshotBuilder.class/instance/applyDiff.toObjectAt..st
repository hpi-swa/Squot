patching
applyDiff: aDiff toObjectAt: path
	| existing patched |
	aDiff hasChanges ifFalse: [^ artifacts at: path].
	existing := artifacts at: path ifAbsentPut: [^ aDiff right].
	patched := existing copyWithDiffApplied: aDiff.
	^ artifacts at: path put: patched