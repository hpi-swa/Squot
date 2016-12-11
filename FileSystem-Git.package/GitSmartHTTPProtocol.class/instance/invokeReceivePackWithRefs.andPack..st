private
invokeReceivePackWithRefs: aDictionary andPack: aPackFile
	| response contents |
	contents := ByteArray streamContents: [:stream |
		writer := GitProtocolWriter on: stream.
		writer updateRequest: aDictionary
			previousReferences: refs
			serverCapabilities: (refs at: #capabilities)
			pack: aPackFile].
	response := self client httpPost: (self urlForService: 'git-receive-pack')
		content: contents type: 'application/x-git-receive-pack-request'.
	response isSuccess ifFalse: [Error signal: response status].
	StringHolder new
		contents: (GitProtocolReader on: response contentStream) readLines;
		openLabel: 'git push response'.