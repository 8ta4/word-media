# Create Word Demo GIF With VHS

## Summary

Create `word-demo.gif`, a short terminal GIF in the current `word-media` repo demonstrating the already-set-up `word` Neovim plugin.

Use:

- `vhs` for capture
- `auto-editor` for trimming slow/static waits
- `ffmpeg` for final GIF encoding

No public APIs, types, or repo code change. The intended tracked outputs are the GIF and a committed demo markdown fixture.

## Implementation

- Stage intermediate media in a temporary working directory.
- Add a committed `demo.md` file with one intentionally rough sentence:
  `This sentence dont read right, but the idea is useful.`
- Create a VHS tape that:
  - Uses the yabai-managed terminal layout, `TokyoNight` theme, and fixed font size.
  - Opens the committed `demo.md` in Neovim from the existing `word` plugin checkout.
  - Hidden from capture: requests `word` suggestions.
  - Shows the pending state and waits briefly for the HUD/suggestions.
  - Hidden from capture: applies suggestion 1.
  - Shows the rewritten sentence for about 2 seconds, then exits Neovim.
- Render a raw MP4 with VHS.
- Trim low-motion/static waiting time with `auto-editor`, using motion detection and a small margin.
- Encode the final GIF with an ffmpeg palette pass for readable text and modest size.

## Test Plan

- Verify the GIF exists.
- Verify `demo.md` is tracked and contains the intended rough sentence.
- Verify media metadata with `file` and `magick identify`.
- Render representative frames and inspect that:
  - Neovim opens with the rough sentence visible.
  - The `word` HUD appears with explanation/suggestions.
  - Applying suggestion 1 visibly rewrites the sentence.
  - The final GIF loops cleanly and remains readable in the captured layout.

## Assumptions

- The GIF belongs in the current `word-media` repo.
- The demo should use the real configured Neovim plugin, not a synthetic mock.
- Exact model wording can vary; success is showing the plugin workflow clearly.
- If the live model call fails entirely, do not ship a broken GIF; stop and report the plugin/API failure instead of fabricating a result.
