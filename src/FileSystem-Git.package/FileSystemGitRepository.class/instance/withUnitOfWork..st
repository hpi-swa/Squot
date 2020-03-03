private
withUnitOfWork: aBlock
	"We assume that a filesystem is created to perform a unit of work."
	^ repository withUnitOfWork: aBlock