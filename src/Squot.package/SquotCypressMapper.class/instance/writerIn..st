as yet unclassified
writerIn: aFileSystem
	| directory |
	directory := self packageDirectoryIn: aFileSystem.
	^ (self writerClass on: directory)
		fileUtils: (self fileUtilsOn: directory);
		packageDirectory: directory pathString;
		yourself