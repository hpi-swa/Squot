tests
testTrackingWorkspaceMorph
	| workspace systemWindow bindings |
	workspace := Workspace new.
	systemWindow := workspace openLabel: 'Workspace for ', self selector.
	workspace contents: 'This is a sample.'.
	bindings := Dictionary new.
	bindings at: #This put: workspace.
	bindings at: #toBeDeleted put: 'I will be deleted after saving'.
	workspace setBindings: bindings.
	"save"
	workingCopy add: systemWindow at: 'sample workspace.morph'.
	workingCopy saveNewVersionMessage: 'add workspace' interactive: false.
	"modify bindings and properties"
	workspace contents: 'Changed contents'.
	workspace bindings
		at: #newVar put: 25;
		removeKey: #toBeDeleted.
	"restore"
	workingCopy loadVersion: workingCopy baseVersion interactive: false.
	"assert equal to previous state"
	self assert: 'Workspace for ', self selector equals: systemWindow label.
	self assert: 'This is a sample.' equals: workspace contents.
	self assert: workspace == systemWindow model.
	self assert: workspace == (workspace bindingOf: #This).
	self assert: 'I will be deleted after saving' == (workspace bindingOf: #toBeDeleted).
	self assert: (workspace bindingOf: #newVar) isNil.
	systemWindow delete.