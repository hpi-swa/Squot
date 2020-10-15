accessing
whileCancellingDo: aBlock

	cancelling := true.
	aBlock ensure: [cancelling := false]