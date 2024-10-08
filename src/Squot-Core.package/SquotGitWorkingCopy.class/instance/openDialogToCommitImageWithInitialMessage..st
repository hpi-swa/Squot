dialog
openDialogToCommitImageWithInitialMessage: aString
	^ (self pendingChangeSetsToCommit: self changeSetsFromHeadCommitToImage)
		initialMessage: aString;
		alwaysOpenDialog;
		commit