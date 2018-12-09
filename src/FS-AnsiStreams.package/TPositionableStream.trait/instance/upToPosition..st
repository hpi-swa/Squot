accessing
upToPosition: anInteger
	"Answer a subcollection containing items starting from the current position and ending including the given position. Usefully different to #next: in that in the case of MultiByteFileStream, and perhaps others, positions measure in terms of encoded items, while #next: convention is to name a number of items, independent of their encoding in the underlying buffer."
	^ self next: anInteger - self position