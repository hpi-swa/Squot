accessing
repository: aRepository
	repository := aRepository.
	"recursively walk over the treeMap and change the repository".
	treeMap do: [ :gitObject | gitObject repository: aRepository ]