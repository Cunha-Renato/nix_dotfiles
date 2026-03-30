{
	programs.zsh = {
		enable = true;

		enableCompletion = true;
		autosuggestion.enable = true;
		syntaxHighlighting.enable = true;

		oh-my-zsh = {
			enable = true;

			theme = "gnzh";

			plugins = [
				"git"
			];
		};
        
        shellAliases = {
            hypr-shell = "nix develop ~/nix_dotfiles#hypr_shell";
        };
	};
}
