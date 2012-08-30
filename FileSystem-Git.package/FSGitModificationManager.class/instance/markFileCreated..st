accessing
markFileCreated: aPath 
	"only files trigger changes"
	hasChanges := true.
	^ self markCreated: aPath