initialize-release
in: aRepository hash: aHash size: anInteger
	"Initialize with the repository reference and the known hash value, but do not load the data yet."
	| object |
	object := self in: aRepository.
	object setHash: aHash size: anInteger.
	^ object