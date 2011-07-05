resolving
unknownOrigin: origin
	| reference |
	^ (next ifNotNil: [next resolve: origin]) ifNil: 
			[reference := FSResolutionRequest for: origin.
			reference ifNotNil: [cache at: origin put: reference]]