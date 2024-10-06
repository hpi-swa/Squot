accessing
mappedPathPatterns
	^ (self trackedMappers copyWith: SquotMetadataMapper new) gather: #mappedPathPatterns