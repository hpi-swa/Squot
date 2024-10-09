running
edit
	self inform: ('You can now edit {1}. When you are done, press continue and your changes will be committed.'
					format: {self commit showOneLine}).
	^ self afterContinue: [self commitImage]