
.PHONY: stow
stow:
	stow .

.PHONY: stow-delete
stow-delete:
	stow -D .

.PHONY: switch
switch:
	(cd home-manager && home-manager switch --flake .#michal)
