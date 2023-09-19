actions
actionCommit
	^ self openDialogToCommitChangeSets:
		(self activeWorkingCopyIfNilInformAnd: [^ nil])
			changeSetsFromHeadCommitToImage