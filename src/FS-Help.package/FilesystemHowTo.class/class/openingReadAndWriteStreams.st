pages
openingReadAndWriteStreams
	"This method was automatically generated. Edit it using:"
	"FilesystemHowTo edit: #openingReadAndWriteSTreams"
	^HelpTopic
		title: 'Opening read and write streams'
		contents: 
'** How to use Filesystem - Opening read and write streams **
=====================================================

FSReference provides easy access to streams:
	working := FSLocator imageDirectory.
	stream := (working / ''letter.txt'') writeStream.
	stream nextPutAll: ''Hello Alice''.
	stream close.
	stream := (working / ''letter.txt'') readStream.
	stream contents.									" --> ''Hello Alice'' "
	stream close.
	
Note that #writeStream overrides any existing file and that #readStream throws an exception if the file does not exist. There are also short forms available which ensure the correct closing of the stream:
	working / ''letter.txt'' writeStreamDo: [ :stream | stream nextPutAll: ''Hello Alice'' ].
	working / ''letter.txt'' readStreamDo: [ :stream | stream contents ].!' readStream nextChunkText