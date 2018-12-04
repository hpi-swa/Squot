as yet unclassified
baseline: spec
	<baseline>
	spec for: #common do: [
		spec 
			preLoadDoIt: #preLoad;
			baseline: 'Squot' with: [spec repository: 'github://hpi-swa/Squot:master/src'];
			package: 'LBGit-Core' with: [spec requires: #('Squot')];
			package: 'LBGit-Tests' with: [spec requires: #('LBGit-Core')];
			group: 'default' with: #('LBGit-Core');
			group: 'tests' with: #('LBGit-Tests')
		].