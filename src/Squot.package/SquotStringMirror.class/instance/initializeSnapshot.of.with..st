capturing
initializeSnapshot: aSquotObjectShadow of: aString with: aSquotObjectCapturer
	aSquotObjectShadow value: (aString copy flag: #todo). "Using copies of the string means that those string snapshots are still recognized as real strings by the meta object protocol.".