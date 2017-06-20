diffing low-level
transformingFrom: leftObjectShadow to: rightShadow
	"Answer a diff that would transform leftMetaobject into rightShadow"
	| diff finished |
	diff := (comparedObjects at: leftObjectShadow ifAbsentPut: [Dictionary new])
		at: rightShadow
		ifPresent: [:existing | ^ existing]
		ifAbsentPut: [leftObjectShadow diffClass new].
	[diff diff: leftObjectShadow against: rightShadow with: self.
	finished := true]
	ensure: [finished == true
			ifFalse: [(comparedObjects at: leftObjectShadow) removeKey: rightShadow]].
	^ diff