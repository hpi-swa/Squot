capturing
initializeSnapshot: aSquotBitsObjectShadow of: aString with: aSquotObjectCapturer 
	self flag: #todo. "Using copies of the string means that those string snapshots are still recognized as real strings by the meta object protocol."
	aSquotBitsObjectShadow value: aString copy.