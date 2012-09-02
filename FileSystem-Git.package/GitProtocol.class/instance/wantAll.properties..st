commands
wantAll: gitSignatures properties: gitProtocolProperties
"TODO:
#readPackfileResponse writes pack to file. need to unpack that file into a repository and read from there. Then answer the objects."
	| requestLines |
	requestLines := Array new: gitSignatures size + 1.
	
	requestLines at: 1 put: (self encodeCommandLine: 
		(String streamContents: [ :stream|
			stream << 'want ' << gitSignatures first.
			stream space print: gitProtocolProperties ])).
	
	2 to: gitSignatures size do: [ :i|
		requestLines at: i put: (self encodeCommandLine: 'want ', (gitSignatures at: i)) ].
	
	requestLines at: requestLines size put: '00000009done', String lf.
	self sendData: ('' join: requestLines).
	^ self readPackfileResponse
	