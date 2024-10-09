accessing
mappedPathPatterns
	^ (self trackedMappers copyWith: GSMetadataMapper new) gather: #mappedPathPatterns