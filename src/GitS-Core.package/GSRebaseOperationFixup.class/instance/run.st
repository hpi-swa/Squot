running
run
	^ (self browser
			actionFixup: self commit
			keepCurrentMessage: self keepCurrentMessage
			editMessage: self editMessage)
		then: [:x | self nextOperation]