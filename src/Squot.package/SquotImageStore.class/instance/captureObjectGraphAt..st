capturing
captureObjectGraphAt: path
	| object metadata |
	object := self objectAt: path.
	metadata := self metadataForObjectAt: path.
	^ self capture: object withMetadata: metadata