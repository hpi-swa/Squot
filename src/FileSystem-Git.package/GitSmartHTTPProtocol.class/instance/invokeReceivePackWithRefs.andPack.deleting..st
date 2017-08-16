private
invokeReceivePackWithRefs: updateAssociations andPack: aPackFile deleting: deleteRefs
	| response contents responseReader report |
	'Uploading' displaySequentialProgress:
	[contents := ByteArray streamContents: [:stream |
		writer := GitProtocolWriter on: stream.
		writer updateRequest: updateAssociations
			deleting: deleteRefs
			previousReferences: refs
			serverCapabilities: (refs at: #capabilities)
			pack: aPackFile].
	response := self postToReceivePack: contents.
	response isSuccess ifFalse: [
		(response code = 401
			ifTrue: [GitRemoteAuthenticationFailed]
			ifFalse: [GitRemoteError]) signal: response status].
	responseReader := GitProtocolReader on: response contentStream.
	report := responseReader readReceivePackResponse.
	report hasErrors ifTrue: [self error: 'Not all references could be updated.'].
	^ report]