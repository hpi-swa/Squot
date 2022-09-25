comparing
newMergeOf: workingObject with: rightObject basedOn: baseObject
	"Answer a new instance of a merge. Note that baseObject can currently be nil if both sides of a merge introduce the same object, but the base version does not have it."
	^ self subclassResponsibility