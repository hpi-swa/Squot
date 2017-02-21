capabilities
reportStatus
	
	"The upload-pack process can receive a 'report-status' capability,
which tells it that the client wants a report of what happened after
a packfile upload and reference update.  If the pushing client requests
this capability, after unpacking and updating references the server
will respond with whether the packfile unpacked successfully and if
each reference was updated successfully.  If any of those were not
successful, it will send back an error message.  See pack-protocol.txt
for example messages."
	
	^ self enable: #'report-status'