tests
testRejectArtifactMetadataChange
	| path metadataRootNode modificationNode removalNode acceptReturned patch propertyAtFirst |
	path := 'changed-artifact'.
	tool := self newToolOn: (patch := self patchChangingArtifactMetadataAt: path).
	propertyAtFirst := (self changedArtifactAt: path in: patch) storeInfo at: #customProperty.
	self assert: tool rootNodes size = 1. tool selectNode: tool rootNodes first.
	self assert: tool selectedNode hasChildren. tool selectNode: tool selectedNode children first.
	self assert: (tool selectedNode title asString asLowercase includesSubstring: "M"'etadata').
	metadataRootNode := tool selectedNode.
	self assert: metadataRootNode hasChildren.
	modificationNode := metadataRootNode children detect: [:each | each title asString includesSubstring: 'customProperty'].
	removalNode := metadataRootNode children detect: [:each | each title asString includesSubstring: 'toBeRemoved'].
	tool selectNode: modificationNode.
	self assert: (modificationNode title asString includesSubstring: 'new').
	tool deactivateSelectedNode.
	tool selectNode: removalNode.
	tool deactivateSelectedNode.
	self closeDialogPossiblyOpenedDuring: [tool accept. acceptReturned := true]
		timeoutMsecs: 5.
	self assert: acceptReturned == true.
	self deny: (self resultHasChangesAt: path) description: 'Excluded changes not excluded'.
	"Make sure that the original snapshot of the comparison was not altered. This was incorrect for some time in the past."
	self assert: propertyAtFirst equals: ((self changedArtifactAt: path in: patch) storeInfo at: #customProperty);
		deny: ((self changedArtifactAt: path in: patch) storeInfo includesKey: #toBeRemoved).