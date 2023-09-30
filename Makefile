.PHONY: init
init:
	chezmoi init --apply --verbose

.PHONY: apply
apply:
	chezmoi apply --verbose

.PHONY: watch
watch:
	watchexec make apply

.PHONY: reset
reset:
	chezmoi state delete-bucket --bucket=scriptState
