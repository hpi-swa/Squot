verifying
verifyIndexVersion
	(fullStream next: 4) = self indexVersionTwo ifFalse: [
		GitInvalidIndexFileError signal: 'This index file is not of version 2.' ]