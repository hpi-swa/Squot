comparing
patchRelativeToBase: aVersion
	| patch baseForUnsavedChanges unsavedChanges |
	patch := self baseVersion
		ifNil: [baseForUnsavedChanges := aVersion.
			SquotPatch with: {}]
		ifNotNil: [:myparent | baseForUnsavedChanges := myparent.
			myparent patchRelativeToBase: aVersion].
	"add unsaved changes on top"
	unsavedChanges := (SquotSnapshot with: store artifacts) patchRelativeToBase: baseForUnsavedChanges.
	^ unsavedChanges applyOnTopOf: patch