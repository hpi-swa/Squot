Squot-shadow-diffing
squotDiffAgainst: otherShadow with: aDiffBuilder
	"Answer an object that describes the differences between me and otherContent."
	self deprecated: 'Implement newDiffFrom:to: in the SquotMirror of self to create a new diff object. Implement initializeFrom:to: in that diff object. Do not compare objects referenced from self in these methods.'.
	^ aDiffBuilder diffFrom: self to: otherShadow
		ifNew: [self shouldBeImplemented]
		andInitialize: [:diff | self shouldBeImplemented.
			"for example:"
			diff diff: self against: otherShadow with: aDiffBuilder]