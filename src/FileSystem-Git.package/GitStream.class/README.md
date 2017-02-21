I am a wrapper for a WriteStream on a ByteArray. I provide convenience conversions for certain content that is written to the stream to simplify code (e.g. converting a String argument to a ByteArray before writing it on the stream).

Instance Variables:
	stream	<WriteStream>
		The internally used WriteStream