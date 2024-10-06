toolbuilder
buildButton: aString action: aBlock with: builder
	^ builder pluggableActionButtonSpec new
		model: aBlock;
		action: #value;
		label: aString;
		yourself