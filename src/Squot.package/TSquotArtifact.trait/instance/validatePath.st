serializing
validatePath
	"Some serializers require special path conventions (e. g., Cypress does)"
	| serializerName |
	self deprecated: 'Path should be corrected explicitly using the stores.'.
	self flag: #todo.
	"This is the only place that indirectly signals SquotPathChanged.
	When this method here is removed, also remove SquotPathChanged signalling from
	SquotArtifact>>path: and the handling from SquotWorkingCopy>>handlePathChangesDuring:."
	serializerName := self serializerName.
	self path:
		((Environment current valueOf: serializerName)
			rewritePath: self path for: self content)