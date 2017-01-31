accessing
content
	^ fileReference readStreamDo: [:stream | stream contents]