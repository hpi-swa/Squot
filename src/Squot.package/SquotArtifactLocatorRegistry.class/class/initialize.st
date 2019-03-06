class initialization
initialize
	"SquotArtifactLocatorRegistry initialize"
	Default ifNil: [Default := self new].
	Current ifNil: [Current := Default].