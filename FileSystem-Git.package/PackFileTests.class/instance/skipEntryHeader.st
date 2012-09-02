helpers
skipEntryHeader
	"First bit of 1: another header byte follows.
	First bit of 0: no more header bytes. Next byte is data."
	[ (packReader peek bitAnd: 2r10000000) isZero ] whileFalse: [ packReader next ].
	"skip last header byte"
	packReader next