accessing
resetAt: path
	| diff |
	diff := diffs removeKey: path ifAbsent: [^ self].