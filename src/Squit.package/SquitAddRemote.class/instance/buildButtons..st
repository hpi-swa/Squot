toolbuilder
buildButtons: builder
	^ {
	builder pluggableButtonSpec new
		model: self; 
		label: 'OK';
		action: #acceptAndClose;
		color: #okColor.
	builder pluggableButtonSpec new
		model: self; 
		label: 'Cancel';
		action: #cancelAndClose;
		color: #cancelColor.
	}