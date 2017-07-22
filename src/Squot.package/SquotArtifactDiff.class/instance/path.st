accessing
path
	"Answer that path to which this diff can be applied."
	^ left
		ifNotNil: [left path]
		ifNil: [right path]