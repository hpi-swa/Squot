Squot repository
withUnitOfWork: aBlock
	"If no unit of work is currently in the dynamic scope, create one for the block.
	Otherwise continue with the current unit of work."
	SquotToggles useUnitOfWorkInterface ifFalse: [^ aBlock value].
	^ aBlock value