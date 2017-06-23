diffing low-level
transformingFrom: leftObjectShadow to: rightShadow
	"Answer a diff that would transform leftObjectShadow into rightShadow"
	| diff |
	diff := (comparedObjects at: leftObjectShadow undecorated ifAbsentPut: [Dictionary new])
		at: rightShadow undecorated
		ifPresent: [:existing | ^ existing]
		ifAbsentPut: [leftObjectShadow diffClass new].
	objectDiffs at: leftObjectShadow undecorated put: diff.
	diff diff: leftObjectShadow against: rightShadow with: self.
	diff squotHasChanges ifTrue:
		[resultPatch addDiff: diff forObjectNamed: (shadowNames at: leftObjectShadow)].
	^ diff