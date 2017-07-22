diffing low-level
transformingFrom: leftObjectShadow to: rightShadow
	"Answer a diff that would transform leftObjectShadow into rightShadow"
	^ self diffFrom: leftObjectShadow to: rightShadow
		ifNew: [leftObjectShadow diffClass new]
		andInitialize: [:diff | diff diff: leftObjectShadow against: rightShadow with: self].