accessing
nameOf: anObject ifAbsent: aBlock
	"Posing as an object graph in merges, pretend that none of my objects have an identity."
	^ aBlock value