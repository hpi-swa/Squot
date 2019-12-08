serializing
validatePath
	"Some serializers require special path conventions (e. g., Cypress does)"
	| serializerName |
	self deprecated: 'Path should be corrected explicitly using the stores.'.
	serializerName := self serializerName.
	self path:
		((Environment current valueOf: serializerName)
			rewritePath: self path for: self content)