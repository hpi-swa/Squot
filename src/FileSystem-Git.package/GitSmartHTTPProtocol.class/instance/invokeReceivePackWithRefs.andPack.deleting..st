private
invokeReceivePackWithRefs: updateAssociations andPack: aPackFile deleting: deleteRefs
	| response contents responseReader report |
	contents := ByteArray streamContents: [:stream |
		writer := GitProtocolWriter on: stream.
		writer updateRequest: updateAssociations
			deleting: deleteRefs
			previousReferences: refs
			serverCapabilities: (refs at: #capabilities)
			pack: aPackFile].
	self client userAgent: 'git/FileSystem-Git via ', self client defaultUserAgent.
	response := self client httpPost: (self urlForService: 'git-receive-pack')
		content: contents type: 'application/x-git-receive-pack-request'.
	response isSuccess ifFalse: [Error signal: response status].
	responseReader := GitProtocolReader on: response contentStream.
	report := responseReader readReceivePackResponse.
	report hasErrors ifTrue: [self error: 'Not all references could be updated.'].
	^ report