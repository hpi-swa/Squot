accessing
contents
	| contents |
	contents := super contents.
	"NOTE: sourcePos will usually start at 0, independent of the position of the source stream"
	sourceStream ifNotNil: [ sourceStream skip: (sourceLimit - sourcePos) negated ].
	^ contents