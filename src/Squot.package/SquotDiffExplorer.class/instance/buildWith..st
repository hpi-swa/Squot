ui toolbuilder
buildWith: builder
	| mainWidgets window |
	mainWidgets := self chooserWidgetSpecs: builder.
	window := builder pluggableWindowSpec new.
	window model: self;
		label: 'Changed Artifacts' ;
		children: mainWidgets.
	^ builder build: window