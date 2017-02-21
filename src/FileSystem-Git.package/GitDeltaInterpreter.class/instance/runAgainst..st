public-executing
runAgainst: aByteArray
	source := aByteArray.
	commands := instructions readStream.
	source size = self readBaseObjectSize ifFalse: [ 
		GitInvalidPackFileError signal: 'Actual size of delta base object is not the same as announced by packfile.' ].
	output := (ByteArray new: self readFinalObjectSize) writeStream.
	self run.

	^ output contents