resolving conflicts
editTo: modifiedOperationContent

	"TODO: maybe change selector to chooseAnother:"
	previousContent := content copy.
	content squotChooseAnother: modifiedOperationContent.
	self chooseRight.