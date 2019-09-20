accessing
sameValueIn: aGraph ifAbsent: aBlock
	"Answer the same object in another object, or evaluate the block if the other graph
	does not contain an edition of the same object."
	^ self value sameIn: aGraph withName: self valueName ifAbsent: [aBlock value]