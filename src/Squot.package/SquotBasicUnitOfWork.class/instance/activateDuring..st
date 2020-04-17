unit of work
activateDuring: aBlock
	"Activate the unit of work for the current process while the block is evaluated.
	If the repository receives #unitOfWork during the block, it should answer me unless there is another nested unit of work going on.
	Answer the result of evaluating aBlock."
	^ self subclassResponsibility