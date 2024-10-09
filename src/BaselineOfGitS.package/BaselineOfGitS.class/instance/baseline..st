baseline
baseline: spec
	<baseline>
	spec for: #common do: [
		spec
			baseline: 'Ston' with: [
				spec
					repository: 'github://squeak-smalltalk/squeak-ston:squeak/repository'];
			baseline: 'FileTree' with: [
				spec
					repository: 'github://dalehenrich/filetree:squeak4.3/repository'];
			baseline: 'Tonel' with: [
				spec
					repository: 'github://squeak-smalltalk/squeak-tonel:squeak/'];
			package: 'JSON' with: [
				spec
					repository: 'https://www.squeaksource.com/JSON'];
			package: 'SqueakSSL-Core' with: [
				spec
					repository: 'http://source.squeak.org/trunk'];
			package: 'WebClient-Core' with: [
				spec
					repository: 'http://source.squeak.org/trunk';
					file: 'WebClient-Core-jr.104'];
			package: 'WebClient-HTTP' with: [
				spec
					repository: 'http://source.squeak.org/trunk';
					file: 'WebClient-HTTP-cmm.6'];
			package: 'INIFile' with: [
				spec
					repository: 'http://www.squeaksource.com/INIFile';
					file: 'INIFile-jf.3'];
			package: 'DiffMerge' with: [
				spec
					repository: 'http://www.squeaksource.com/DiffMerge';
					file: 'DiffMerge-tonyg.12'];
			baseline: 'FileSystem' with: [
				spec
					repository: 'github://squeak-smalltalk/squeak-filesystem:master/src';
					loads: #('default' 'tests')];
			package: 'VersionControl';
			package: 'FileSystem-Git' with: [
				spec
					requires: #('FileSystem' 'VersionControl' 'INIFile')];
			package: 'GitS-Core' with: [
				spec
					requires: #('FileSystem' 'VersionControl' 'FileSystem-Git' 'DiffMerge' 'Ston' 'Tonel');
					postLoadDoIt: #postLoad].
		spec 
			group: 'FileSystemGit' with: #('FileSystem-Git');
			group: 'default' with: #('GitS-Core');
			group: 'tests' with: #('default')].
	
	spec for: #'squeakCommon' do: [
		spec
			package: 'GitS-Compatibility';
			package: 'GitS-Core' with: [
				spec includes: 'GitS-Compatibility']].