Output "/private/tmp/word-demo-raw.mp4"

Require nvim
Require zsh

Set Shell "zsh"
Set FontFamily "FiraCode Nerd Font"
Set FontSize 30
Set Width 1512
Set Height 982
Set Padding 0
Set Framerate 30
Set Theme "TokyoNight"
Set TypingSpeed 30ms

Hide
Type "cd /Users/a/.local/share/nvim/lazy/word"
Enter
Show

Type "nvim -n /Users/a/dev/word-media/word-media.git/word-demo-fixture-vhs-tape/demo.md"
Enter
Sleep 1s

Hide
Type ":lua require('word').suggest()"
Enter
Show

Sleep 2s

Hide
Type ":lua vim.wait(60000, function() return vim.fn.winnr('$') > 1 end, 100)"
Enter
Show

Sleep 1s

Hide
Type ":lua require('word').apply(1)"
Enter
Type ":setlocal nomodified"
Enter
Show

Sleep 2s
Type ":qa"
Enter
Sleep 500ms
