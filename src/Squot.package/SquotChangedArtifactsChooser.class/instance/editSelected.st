operations
editSelected
	| selectedArtifact editor editorUI newArtifact originalArtifact proposedArtifact |
	editor := self editorFor: (selectedArtifact := self selectedArtifact).
	editorUI := editor buildUI.
	((self dependents detect: #isInSystemWindow) outermostMorphThat: #isSystemWindow)
		openModal: editorUI.
	newArtifact := selectedArtifact copyWithDifferentContent: (editor result ifNil: [^ self]).
	newArtifact = selectedArtifact
		ifTrue: [^ self "no change"].
	newArtifact = (originalArtifact := self originalOf: selectedArtifact)
		ifTrue: [newArtifact := originalArtifact]
		ifFalse: [newArtifact = (proposedArtifact := self proposedOf: selectedArtifact)
				ifTrue: [newArtifact := proposedArtifact]].
	effective at: selectedArtifact path put: newArtifact.
	self listChanged.