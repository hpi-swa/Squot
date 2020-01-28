tests
testTrackingWorkspaceMorph
	<timeout: 10>
	| workspace systemWindow bindings previousOwner |
	workspace := Workspace new.
	systemWindow := workspace openLabel: 'Workspace for ', self selector.
	workspace contents: 'This is a sample.'.
	bindings := Dictionary new.
	bindings at: #This put: workspace.
	bindings at: #toBeDeleted put: 'I will be deleted after saving'.
	workspace setBindings: bindings.
	"save"
	workingCopy add: systemWindow at: 'sample workspace.morph'.
	workingCopy saveVersionWithMessage: 'add workspace'.
	"modify bindings and properties"
	workspace contents: 'Changed contents'.
	workspace bindings
		at: #newVar put: 25;
		removeKey: #toBeDeleted.
	"restore"
	previousOwner := systemWindow owner.
	workingCopy loadVersion: workingCopy baseVersion interactive: false.
	"assert equal to previous state"
	systemWindow owner == previousOwner
		ifFalse: [previousOwner privateRemove: systemWindow. "fix it!"
			self fail: 'Top owner was changed, but should not have been.'].
	self assert: 'Workspace for ', self selector equals: systemWindow label.
	self assert: 'This is a sample.' equals: workspace contents.
	self assert: workspace == systemWindow model.
	self assert: workspace == (workspace bindingOf: #This) value.
	self assert: 'I will be deleted after saving' equals: (workspace bindingOf: #toBeDeleted) value.
	self deny: (workspace hasBindingOf: #newVar).
	systemWindow delete.