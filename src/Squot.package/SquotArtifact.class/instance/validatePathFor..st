initialize-release
validatePathFor: anObject
	"Some serializers require special path conventions (e. g., Cypress does)"
	path := (Environment current valueOf: (storeInfo at: #serializer))
		rewritePath: path for: anObject