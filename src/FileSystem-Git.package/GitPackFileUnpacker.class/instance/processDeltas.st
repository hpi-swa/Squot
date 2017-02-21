operations
processDeltas
	self deltaQueue do: [ :packedDelta | 
		self unpackDelta: packedDelta ]