private
checkDirectory: aDirectory ifNotEmpty: aBlock
	aDirectory fileSystem childrenAt: aDirectory do: [:unimportant | aBlock value].