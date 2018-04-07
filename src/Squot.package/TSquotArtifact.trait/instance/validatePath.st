serializing
validatePath
	"Some serializers require special path conventions (e. g., Cypress does)"
	| serializerName |
	serializerName := self serializerName.
	self path:
		((Environment current valueOf: serializerName)
			rewritePath: self path for: self content)