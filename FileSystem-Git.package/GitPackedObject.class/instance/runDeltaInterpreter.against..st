processing
runDeltaInterpreter: interpreter against: base
	typeByte :=  base byteTypeCode.
	unpackedBytes := interpreter runAgainst: base unpackedBytes