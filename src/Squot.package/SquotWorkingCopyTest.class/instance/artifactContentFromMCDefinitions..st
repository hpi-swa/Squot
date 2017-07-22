utilities
artifactContentFromMCDefinitions: definitions
	^ SquotObjectGraph withSingleShadow: (MCSnapshot fromDefinitions: definitions)
	