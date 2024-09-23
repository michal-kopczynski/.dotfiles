
.PHONY: stow
stow:
	stow .

.PHONY: stow-delete
stow-delete:
	stow -D .

.PHONY: switch
switch:
	(cd home-manager && home-manager switch --flake .#michal)

.PHONY: mac-init
mac-init:
	(cd nix-darwin && nix run nix-darwin --extra-experimental-features nix-command --extra-experimental-features flakes -- switch --flake .#host)

.PHONY: mac-switch
mac-switch:
	(cd nix-darwin && darwin-rebuild switch --flake .#host)

.PHONY: prune
prune:
	nix-store --gc
