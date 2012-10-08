private
readPackfileResponse 
"TODO:
find out, why SocketStream doesn't deliver all of the data or corrupts it (or who else does).
Careful: when using Transcript for debugging, the code might become so slow that you won't see any problems with receiving data..."
	
	| stream length sideband content |
	
	stream := (FileSystem disk workingDirectory / 'packfile.pack') writeStream.
	
	self stream binary.
	
	[[ true ] whileTrue: [
		self stream atEnd ifTrue: [ ^ self ].
		length := self readContentLength.
		self peekForNAK 
			ifTrue: [ self consumeNAK ]
			ifFalse: [
				sideband := self readSideband.
				content := self readContentOfLength: length - 1 "remove sideband byte".
				sideband = 1
					ifFalse: [ "log progress info etc.  here if you want to"
						Transcript show: content asString ]
					ifTrue: [ Transcript show: 'read ', content size asString, ' bytes'; cr. stream nextPutAll: content ]]] 
	] ensure: [ stream close ].

	self stream ascii.