comparing
squotDiffAgainst: otherShadow with: aDiffBuilder
	"Answer an object that describes the differences between me and otherShadow."
	^ aDiffBuilder diffFrom: self to: otherShadow
		ifNew: [self diffClass new]
		andInitialize: [:diff | diff diff: self against: otherShadow with: aDiffBuilder]