actions
push

	"self workingCopy repository gitRepository push: {self branchName} toRemote: 'origin'."
	self browser 
		projectSelection: self workingCopy;
		branchSelection: self branchName;
		actionPush.