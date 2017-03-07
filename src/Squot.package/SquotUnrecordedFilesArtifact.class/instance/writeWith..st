serializing
writeWith: aSerializer
	"I already represent files, no need to serialize them again."
	self shouldNotImplement