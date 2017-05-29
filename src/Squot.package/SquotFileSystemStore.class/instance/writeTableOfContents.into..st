private storing
writeTableOfContents: toc into: aFile
	toc sort.
	aFile writeStreamDo: [:stream | STON squotPut: toc onStream: stream].