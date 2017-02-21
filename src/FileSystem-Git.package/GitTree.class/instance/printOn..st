printing
printOn: aStream
	super printOn: aStream.
	aStream << '( '.
	entries keys 
		do: [ :name| aStream << name]
		separatedBy: [ aStream << ', '].
	aStream << ' )'