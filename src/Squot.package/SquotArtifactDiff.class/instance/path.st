accessing
path
	"Answer that path to which this diff can be applied."
	^ left
		ifNil: [right path]
		ifNotNil: [left path]