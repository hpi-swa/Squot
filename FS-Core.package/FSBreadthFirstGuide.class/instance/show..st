showing
show: aReference 
	work add: aReference entry.
	self whileNotDoneDo: [ self visitNextEntry: work removeFirst ]