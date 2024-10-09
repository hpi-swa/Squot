editing
copyOf: aDefinition withSources: aCollection notifying: requestors ifFail: aBlock
	^ aDefinition gitSCopyWithSources: aCollection notifying: requestors ifFail: aBlock