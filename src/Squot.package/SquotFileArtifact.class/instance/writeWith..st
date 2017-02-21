serializing
writeWith: aSerializer
	"I already am a file, no need to serialize me again."
	self shouldNotImplement