.PHONY: setup setup-macos setup-macos-dry

setup: 
	bin/setup.sh

setup-macos:
	bin/setup_macos.sh

setup-macos-dry:
	bin/setup_macos.sh --dry-run
