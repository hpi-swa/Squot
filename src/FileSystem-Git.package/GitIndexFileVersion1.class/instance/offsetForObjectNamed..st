accessing
offsetForObjectNamed: hexHash
	"Careful:
	#indexForObjectNamed for version 1 indices answers offset into pack file!"
	^ self indexForObjectNamed: hexHash