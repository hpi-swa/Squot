private
fetchRefsFrom: aStream
	^ (GitProtocolReader on: aStream) readPktLine; readZeroLine; parseReferenceDiscoveryResponse
