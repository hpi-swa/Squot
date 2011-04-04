showing
show: aReference 
	| entry |
	work add: aReference entry.
	self whileNotDoneDo: 
		[entry := work removeFirst.
		entry isFile 
			ifTrue: [ visitor visitFile: entry]
			ifFalse: 
				[visitor visitDirectory: entry.
				work addAll: entry reference entries]]