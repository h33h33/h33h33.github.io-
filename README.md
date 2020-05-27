*Warning: **expect frequent breakage prior to 1.0!** If you run `thoughts update` and it fails, you can probably fix by manually downloading the latest tagged release and reinstalling with `./install.sh another`. If that doesn't fix things, you can always recover from your remote git repo.*

# *thoughts*
*thoughts* is a highly portable shell program for making tweet-like text posts from a terminal, and adding them to a self-contained HTML document.

*thoughts* keeps your `thoughts.html` synced in a remote git repository of your choosing. It's up to you to host the file somewhere, but *thoughts* handles everything else. [Here's what it looks like](https://thoughts.maren.hup.is).

*thoughts'* intended use case is for writing anything less than a blog post.

### Requirements
* POSIX shell (sh, dash, bash, ksh, zsh, and maybe others)
* coreutils
* Git

*Note: Portability is the primary priority. Please open an issue if any shell code or coreutil invocations behave unexpectedly.*

## How it works

* Type `thoughts` in a terminal and press `<enter>`
* Your preferred editor opens. Type your thought, then save and exit
* *thoughts* outputs a single, self-contained HTML file with your thought added. The thought is timestamped and the timestamp is linkified.
* *thoughts* pushes your updated `thoughts.html` to a remote git repository of your choosing. It's up to you to host it somewhere.

## Installing
*Download the most recent release from [here](https://github.com/marenbeam/thoughts/releases). `master` is used for development, and is sometimes broken.*

Install from anywhere with `./install.sh`.

### First install:
*(Do this if you've never set up thoughts before)*
* Install and configure git
* Download the latest tagged release of *thoughts* from [here](https://github.com/marenbeam/thoughts/releases).
* Install with `./install.sh`
* Add `~/.local/bin` to your PATH
* Use `git init` to create a git repository in `~/.local/share/thoughts`, then point it at an empty remote origin
* Be sure the repo is set up properly:
  * `$ cd ~/.local/share/thoughts`
  * `$ git add .`
  * `$ git commit -m "init"`
  * `$ git push`
* From anywhere, type `thoughts`

### Installing on another computer:
*thoughts* can be installed on multiple computers, all updating the same remote `thoughts.html`.

* Install with `./install.sh another`
* Follow the prompts

## Commands
* `$ thoughts update`
  * Download and install the latest tagged release
* `$ thoughts edit`
  * Edit your previously posted thoughts
* `$ thoughts help`
  * Show some helpful information
* `$ thoughts style`
  * Customize the default CSS

## "Markdown"
*thoughts* supports pretend, non-standard markdown that's mostly just HTML. Why hide the details? Here's what's supported:
* Italics
  * `You can write <i>italics</i>`
* Bold
  * `You can write in <b>bold</b>`
* You can write in ***bolditalics*** by nesting those
* Inline code
  * `You can write <code>inline code</i>`
  * Currently, if you put HTML code in an inline code tag, it'll try to render the HTML
* Code blocks
  * ```
    <block>
    You can write code blocks
    With this fake HTML-looking tag I invented
    Each tag must me on its own line or it won't parse
    </block>
    ```
* Links
  * Links are automatically linkified if they start with `http://` or `https://`, and the "h" has a space in front of it

The happy path is pretty narrow! Arbitrary HTML is theoretically supported, but there are likely to be some inexplicable side-effects.

## Notes
* Newlines are converted into `<br>` in all cases, so space your paragraphs as you wish! There will only be space between lines if you put it there.
* *thoughts* is wrapping lots of git behavior
  * The `edit` and `style` commands mostly just dump you into raw HTML/CSS world and leave you to it, but they also wrap git things so that your changes stay synced across all your computers
  * If a git thing is breaking, inspect the situation in `$HOME/.local/share/thoughts` (that's where all *thoughts* data lives)
* *thoughts'* default configuration pulls two fonts from a CDN ([xz/fonts](https://fonts.xz.style/), not Google). You can easily change this with `thoughts style`
* If you post a thought that contains HTML, that HTML will definitely render in the browser. It might work, or it might break horrifically. Have fun!

## Future
My hope is that as of one of the v0.3 point-releases, "preview" will get implemented and then *thoughts* will be feature complete! When 1.0 is ready, then *thoughts* will be "done" -- with all future releases being bug fixes and portability improvements.

* ~Use POSIX coreutils so it can run on Mac/BSD/etc.~ Done!
* ~Use sh rather than bash~ Done!
* ~Source editor from environment~ Done!
* ~Improve installer~ Done!
* ~Add `thoughts update`~ Done!
* ~Automatically linkify URLs~ Done!
* ~Support basic user configuration in a `thoughts.conf`~ Probably won't actually do this
* ~Add `thoughts help`~ Done!
* ~Support a small subset of markdown~ Done!
* ~Edit/delete previous thoughts~ Done!
* Preview thoughts

<3
