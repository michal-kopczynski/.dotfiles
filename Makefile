
.PHONY: stow
stow:
	stow .

.PHONY: stow-delete
stow-delete:
	stow -D .

.PHONY: switch
update:
	(cd home-manager && home-manager switch --flake .#michal)
