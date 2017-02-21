as yet unclassified
printOn: aStream
	aStream << self class name.
	aStream << '('.
	set do: [ :path| aStream << path basename]
		separatedBy: [ aStream << ', '].
	aStream << ')'.