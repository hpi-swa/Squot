testing
hasReceivedMessageWithSelector: aSymbol
	^ receivedMessages anySatisfy: [:each | each selector = aSymbol]