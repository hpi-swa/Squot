public-accessing
hexHashAtPath: aPath
	| entry parent |
	aPath isRoot ifTrue: [^ self hexHash].
	parent := self.
	aPath parent do: [:segment |
		entry := parent entryAt: segment ifAbsent: [^ nil].
		entry isInDirectoryMode ifFalse: [^ nil].
		parent := entry object].
	^ parent entryAt: aPath basename ifPresent: #entryHexHash ifAbsent: [nil]