accessing
head
	^ self filesystemOn: (self unitOfWork headIfAbsent: [ nil ])