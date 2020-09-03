private
writePropertiesIfExists
	"For IceBerg repositories."
	(currentDirectory parent / '.properties') exists ifTrue:
		[currentDirectory parent / '.properties' writeStreamDo:
			[:stream |
			stream truncate; nextPutAll: self propertiesFileContents]].