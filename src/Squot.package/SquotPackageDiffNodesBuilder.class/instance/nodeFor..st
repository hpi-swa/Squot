node creation
nodeFor: aMCPatchOperationOrConflict
	^ aMCPatchOperationOrConflict isConflict
		ifTrue: 
			[SquotMergeDiffNode
				title: aMCPatchOperationOrConflict operation squotDiffNodeSummary
				content: aMCPatchOperationOrConflict
				children: #()
				onInclude: [aMCPatchOperationOrConflict chooseRemote]
				onExclude: [aMCPatchOperationOrConflict chooseLocal]
				onReset: [aMCPatchOperationOrConflict clearChoice]]
		ifFalse: 
			[SquotDiffNode
				title: aMCPatchOperationOrConflict squotDiffNodeSummary
				content: aMCPatchOperationOrConflict
				children: #()
				onInclude: [packageMerge addOperationOrConflict: aMCPatchOperationOrConflict]
				onExclude: [packageMerge removeOperationOrConflict: aMCPatchOperationOrConflict]].