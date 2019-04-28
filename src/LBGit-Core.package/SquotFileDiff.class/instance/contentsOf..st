accessing
contentsOf: aReference

	^ aReference readStreamDo: 
		[:stream | 
			stream binary.
			stream contents]