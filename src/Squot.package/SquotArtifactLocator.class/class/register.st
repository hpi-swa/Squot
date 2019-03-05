registration
register
	"Register an instance of me for general availability.
	Should be invoked from the class initialize method of subclasses."
	SquotArtifactLocatorRegistry current add: self new.