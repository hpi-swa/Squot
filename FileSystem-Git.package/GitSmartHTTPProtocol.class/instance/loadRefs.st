private
loadRefs
	stream := self clientForUploadPackService
		streaming: true;
		get.
	self flag: 'TODO: use streaming response'.
	
	reader := GitProtocolReader on: stream.
	writer := GitProtocolWriter on: stream.
	
	^ reader readPktLine; readZeroLine; parseUploadPackResponse
