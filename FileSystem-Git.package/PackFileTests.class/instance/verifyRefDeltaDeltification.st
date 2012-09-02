verifying
verifyRefDeltaDeltification
	| baseObjectName position result |
	position := packReader position.
	self skipEntryHeader.
	baseObjectName := (packReader next: 20) hex.
	result := self verifyDeltificationWithBaseAt: (self packOffsetOf: baseObjectName).
	packReader position: position.
	^ result