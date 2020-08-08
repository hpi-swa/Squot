public-accessing
withUnitOfWork: aBlock
	"The block can be a unit of work on its own, but may be embedded in a larger unit of work. Ensure that any unit of work is running."
	| unit |
	unit := GitCurrentUnitOfWork forRepository: self.
	^ unit
		ifNil:
			[unit := self newUnitOfWork.
			unit activateDuring: aBlock]
		ifNotNil:
			[aBlock value]