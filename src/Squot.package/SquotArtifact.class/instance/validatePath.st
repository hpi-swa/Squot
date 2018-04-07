serializing
validatePath
	"Some serializers require special path conventions (e. g., Cypress does)"
	self path:
		((Environment current valueOf: self serializerName)
			rewritePath: self path for: self content)