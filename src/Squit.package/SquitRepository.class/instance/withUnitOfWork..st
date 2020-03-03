scope activation
withUnitOfWork: aBlock
	"The block can be a unit of work on its own, but may be embedded in a larger unit of work. Ensure that any unit of work is running."
	SquotToggles useUnitOfWorkInterface ifFalse: [^ aBlock value].
	^ gitRepository repository withUnitOfWork: aBlock