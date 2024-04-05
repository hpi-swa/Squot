actions
actionCreateBranchAtActiveRef
	^ self actionCreateBranchAtRef: (self activeRefIfNilInformAnd: [^ nil])