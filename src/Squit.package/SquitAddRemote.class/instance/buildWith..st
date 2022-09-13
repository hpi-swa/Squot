toolbuilder
buildWith: builder
	| dialog urlWidget remoteNameWidget |
	dialog := builder build: (builder pluggableDialogSpec new
		model: self;
		label: 'Add Git remote';
		message: 'Enter parameters of the new remote:';
		children: {self buildInputPanel: builder};
		buttons: (self buildButtons: builder);
		closeAction: #onClose;
		exclusive: false;
		extent: 475@60 * RealEstateAgent scaleFactor).
	remoteNameWidget := builder widgetAt: 'remoteName'.
	(remoteNameWidget respondsTo: #acceptAction:) ifTrue:
		[remoteNameWidget acceptAction: [:text | self acceptAndClose]].
	remoteNameWidget setSelection: (1 to: remoteName size).
	urlWidget := builder widgetAt: 'remoteUrl'.
	(urlWidget respondsTo: #acceptAction:) ifTrue:
		[urlWidget acceptAction: [:text | urlWidget currentHand newKeyboardFocus: remoteNameWidget]].
	urlWidget setSelection: (1 to: remoteUrl size).
	^ dialog