accessing
readProject
	| toc artifacts |
	artifacts := OrderedDictionary new.
	toc := self tableOfContents.
	toc keysDo:
		[:eachPath | | storeInfo artifact |
		storeInfo := (self metadataForObjectAt: (directory resolve: eachPath)) metadata.
		storeInfo at: #path put: eachPath.
		artifact := SquotArtifact storeInfo: storeInfo.
		artifacts at: artifact id put: artifact].
	self flag: #todo. "Read and write project id and project metadata."
	^ SquotProject id: UUID nilUUID metadata: Dictionary new artifacts: artifacts