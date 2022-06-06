accessing
at: aPackageInfo ifAbsent: aBlock
	self assert: (aPackageInfo isKindOf: PackageInfo).
	(NextFinalization ifNil: [DateAndTime now]) <= DateAndTime now
		ifTrue:
			[Extensions finalizeValues.
			NextFinalization := DateAndTime now + 5 minutes].
	^ Extensions at: aPackageInfo ifAbsent: aBlock