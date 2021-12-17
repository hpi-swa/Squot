accessing
addName: name email: email

	self add: (GitStamp new
		name: name;
		email: email;
		yourself).