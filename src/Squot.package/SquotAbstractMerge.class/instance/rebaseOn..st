merging
rebaseOn: anObject
	"Answer another merge that introduces the same changes as me to anObject as the working copy edition of the merged object."
	^ self subclassResponsibility