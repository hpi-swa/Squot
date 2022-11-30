tests
testAcceptArtifactMetadataChange
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
	tool selectNode: removalNode.
	self closeDialogPossiblyOpenedDuring: [tool accept. acceptReturned := true]
		timeoutMsecs: 5.
	self assert: acceptReturned == true.
	self assert: (self resultHasChangesAt: path) description: 'Metadata changes not viewed as changes'.
	self applyToWorkingCopy.
	self assert: 'new' equals: ((workingCopy artifactAt: path) liveStoreInfo at: #customProperty) description: 'Modification not applied';
		deny: ((workingCopy artifactAt: path) liveStoreInfo includesKey: #toBeRemoved) description: 'Property not removed'.