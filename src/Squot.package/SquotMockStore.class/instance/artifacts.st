accessing
artifacts
	^ (self objects
		collect:
			[:object |
			SquotArtifact new
				content: (self capture: object);
				yourself])
		keysAndValuesDo: [:path :artifact | artifact path: path]