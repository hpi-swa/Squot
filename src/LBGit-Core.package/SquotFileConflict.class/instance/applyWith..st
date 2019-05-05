as yet unclassified
applyWith: aFileListDiff	
	"A conflict cannot be applied - only the diff that has been chosen can"
	self error: 'Conflict must be resolved first'.