actions on objects
actionObjectBrowse
	"Need unit of work for loading lazy artifacts."
	^ self withUnitOfWork: [self objectSelection artifact browse]