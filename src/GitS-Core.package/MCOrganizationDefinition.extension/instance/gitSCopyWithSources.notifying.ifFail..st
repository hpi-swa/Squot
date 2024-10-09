*GitS-Core-Code
gitSCopyWithSources: aCollection notifying: requestors ifFail: aBlock
	^ self class categories: (aCollection first lines collect: #withBlanksTrimmed thenSelect: #notEmpty)