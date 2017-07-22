comparing
squotDiffAgainst: otherShadow with: aDiffBuilder
	"Answer an object that describes the differences between me and otherShadow."
	(otherShadow isNil or: [otherShadow == SquotAbsentValue instance])
		ifTrue: [^ aDiffBuilder onlyLeft: self].
	otherShadow hasSquotShadowSlots
		ifFalse: [^ aDiffBuilder replacing: self with: otherShadow].
	originalClass ~= otherShadow originalClass
		ifTrue: [^ aDiffBuilder migrating: self to: otherShadow].
	^ aDiffBuilder transformingFrom: self to: otherShadow