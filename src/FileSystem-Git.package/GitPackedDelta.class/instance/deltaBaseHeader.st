public-accessing
deltaBaseHeader
	deltaBase ifNotNil: [^ deltaBase header].
	^ self basicDeltaBaseHeader