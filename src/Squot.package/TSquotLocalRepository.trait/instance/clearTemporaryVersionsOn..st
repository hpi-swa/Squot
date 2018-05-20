temporary historians
clearTemporaryVersionsOn: aHistorian
	self delete: (self historianForTemporaryVersionsOn: aHistorian).