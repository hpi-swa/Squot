tests
testTrackingWorkspaceMorph
	<timeout: 10>
	| workspace systemWindow bindings previousOwner artifactId |
	workspace := Workspace new.
	systemWindow := workspace openLabel: 'Workspace for ', self selector.
	workspace contents: 'This is a sample.'.
	bindings := Dictionary new.
	bindings at: #This put: workspace.
	bindings at: #toBeDeleted put: 'I will be deleted after saving'.
	workspace setBindings: bindings.
	"save"
	repository withUnitOfWork:
	[artifactId := (workingCopy add: systemWindow at: 'sample workspace.morph') id.
	workingCopy saveVersionWithMessage: 'add workspace'.
	self assert: artifactId equals: (workingCopy baseVersion artifactAt: 'sample workspace.morph') id.
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
	self assert: artifactId equals: (workingCopy artifactAt: 'sample workspace.morph') id.
	systemWindow delete].