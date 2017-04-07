tests
testWithWorkspaceMorph
	| workspace systemWindow bindings workspaceArtifact restoredSystemWindow |
	workspace := Workspace new.
	systemWindow := workspace openLabel: 'Workspace for ', self selector.
	workspace contents: 'This is a sample.'.
	bindings := Dictionary new.
	bindings at: #This put: workspace.
	workspace setBindings: bindings.
	"store"
	imageStore add: systemWindow at: 'sample workspace.morph'.
	fileStore restoreToSnapshot: imageStore captureSnapshot.
	"assert files"
	(fileStore directory / 'sample workspace.morph') exists.
	(fileStore directory / 'sample workspace.morph.squot-content') exists.
	"restore"
	workspaceArtifact := fileStore captureSnapshot artifactAt: 'sample workspace.morph'.
	restoredSystemWindow := (imageStore materializerFor: workspaceArtifact) materialize: workspaceArtifact replacing: nil.
	restoredSystemWindow openAsIs.
	self assert: systemWindow label equals: restoredSystemWindow label.
	self assert: workspace contents equals: restoredSystemWindow model contents.
	self assert: restoredSystemWindow model ~~ workspace description: 'new workspace'.
	self assert: (restoredSystemWindow model bindingOf: #This) value == restoredSystemWindow model
		description: 'binding to own model'.
	systemWindow delete.
	restoredSystemWindow delete.