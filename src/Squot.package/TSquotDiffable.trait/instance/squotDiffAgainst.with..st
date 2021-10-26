Squot-diffing
squotDiffAgainst: otherContent with: aDiffBuilder
	"Answer an object that describes the differences between me and otherContent."
	self deprecated: 'Implement newDiffFrom:to: in the SquotMirror of self to create a new diff object. Implement initializeFrom:to: in that diff object. Do not compare objects referenced from self in these methods.'