patching
applyDiff: aDiff
	| existing patched |
	existing := artifacts at: aDiff path ifAbsent: [aDiff left absentCopy].
	patched := existing copyWithDiffApplied: aDiff.
	artifacts at: aDiff path put: patched.