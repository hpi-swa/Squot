tests
testRejectArtifactMetadataChange
	| path acceptReturned patch propertyAtFirst |
	path := 'changed-artifact'.
	tool := self newToolOn: (patch := self patchChangingArtifactMetadataAt: path).
	propertyAtFirst := (self changedArtifactAt: path in: patch) storeInfo at: #customProperty.
	self assert: tool rootNodes size = 1. tool selectNode: tool rootNodes first.
	self assert: tool selectedNode hasChildren. tool selectNode: tool selectedNode children first.
	self assert: (tool selectedNode title asString asLowercase includesSubstring: "M"'etadata').
	self assert: tool selectedNode hasChildren. tool selectNode: tool selectedNode children first.
	self assert: (tool selectedNode title asString  includesSubstring: 'new');
		assert: (tool selectedNode title asString includesSubstring: 'customProperty').
	tool deactivateSelectedNode.
	self closeDialogPossiblyOpenedDuring: [tool accept. acceptReturned := true]
		timeoutMsecs: 5.
	self assert: acceptReturned == true.
	self deny: (self resultHasChangesAt: path) description: 'Excluded changes not excluded'.
	"Make sure that the original snapshot of the comparison was not altered. This was incorrect for some time in the past."
	self assert: propertyAtFirst equals: ((self changedArtifactAt: path in: patch) storeInfo at: #customProperty).