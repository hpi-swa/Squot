as yet unclassified
balloonText
	| commit |
	commit := self item.
	^ {'commit ', commit hash asHexHash.
		'Author: ', commit author name, ' <', commit author email, '>'.
		'Date: ', commit author timeStamp asTimeStamp.
		''.
		commit message withBlanksTrimmed.
	} joinSeparatedBy: Character lf