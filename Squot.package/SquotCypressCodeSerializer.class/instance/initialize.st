as yet unclassified
initialize
	| fileUtils |
	super initialize.
	definitions := OrderedCollection new.
	fileUtils := MCFileTreeFileSystemUtilsForSquot new.
	fileTreeWriter := MCFileTreeWriterWithSettableFileUtils on: self "as impostor MCRepository".
	fileTreeWriter fileUtils: fileUtils.
	cypressWriter := MCFileTreeStCypressWriterWithSettableFileUtils on: fileTreeWriter.
	cypressWriter fileUtils: fileUtils.