actions
actionExportActiveProjectToSar
	| workingCopy |
	workingCopy := self activeWorkingCopyIfNilInformAnd: [^ self].
	workingCopy writeSarToRequestedFileName.