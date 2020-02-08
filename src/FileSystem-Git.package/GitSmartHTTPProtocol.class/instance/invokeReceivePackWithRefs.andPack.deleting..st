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
			ifFalse: [GitRemoteError]) signal: response status with: nil remote: remote].
	responseReader := GitProtocolReader on: response contentStream.
	report := responseReader readReceivePackResponse.
	report hasErrors ifTrue: [self error: report asString].
	^ report]