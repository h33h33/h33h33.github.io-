# Thoughts :speaking_head: :thought_balloon:

Thoughts is a POSIX-compliant shell program for making less-than-a-blog-sized text posts from a terminal.

Thoughts keeps your thoughts in a self-contained HTML file, and syncs that file in any remote git repository. It's up to you to serve the file from somewhere, but Thoughts handles everything else.

[Here's](https://maren.hup.is/thoughts) what it can look like.

### Requirements

* POSIX shell
* POSIX coreutils
* Git

*Note: Portability is the primary priority. Thoughts should run without modification on any UNIX-adjacent system. Please open an issue if any shell code or coreutil invocations behave unexpectedly.*

## How it works

* Type `thoughts` in a terminal and press `<enter>`
* Your preferred text editor opens. Type your thought, then save and exit
* Thoughts outputs a single, self-contained HTML file with your thought added. The thought is timestamped and the timestamp is linkified
* Thoughts pushes your updated `thoughts.html` to a remote git repository. 

## Installing

*Download the latest release from [here](https://github.com/marenbeam/thoughts/releases). `master` is used for development, and is sometimes broken.*

Install from anywhere with `./install.sh`

### First install:

*(Do this if you've never set up Thoughts before)*
* Install and configure git
* Download the latest tagged release of Thoughts from [here](https://github.com/marenbeam/thoughts/releases).
* Install with `./install.sh`
* Add `$HOME/.local/bin` to your PATH
* Use `git init` to create a git repository in `$HOME/.local/share/thoughts`, then point it at an empty remote origin
* Be sure the repo is set up properly:
  * ```
    $ cd ~/.local/share/thoughts
    $ git add .
    $ git commit -m "init"
    $ git push
    ```
* From anywhere, type `thoughts`

### Installing on another computer:

Thoughts can be installed on *N* computers, all updating the same remote `thoughts.html`

* Install with `./install.sh another`
* Follow the prompts

## Commands

* `$ thoughts update`
  * Download and install the latest tagged release
* `$ thoughts edit`
  * Edit your previously posted thoughts
* `$ thoughts style`
  * Customize the default CSS
* `$ thoughts preview`
  * Preview a thought in a browser while working on it

## "Markdown"

Thoughts supports non-standard markdown that's mostly just HTML.

* Italics
  * `You can write <i>italics</i>`
* Bold
  * `You can write in <b>bold</b>`
* Inline code
  * `You can write <code>inline code</code>`
* Code blocks
  * ```
    <block>
    You can write code blocks
    with this fake tag I invented.
    Each <block> tag *must* be on
    its own line or it won't parse,
    exactly like this.
    </block>
    ```
* Links
  * Links are automatically linkified if they start with `http://` or `https://`, and the "h" has a space in front of it

Arbitrary HTML is theoretically supported outside of code blocks, but there are likely to be some inexplicable side-effects.

## Notes

* Newlines are converted into `<br>` in all cases
  * Thoughts' goal is to make what you typed in vim appear on the internet, and to make it look roughly the way it did in vim. As such, there will only be space between lines if you put it there -- space things as you wish!
* Thoughts is wrapping lots of git behavior
  * The `edit` and `style` commands just dump you into raw HTML/CSS world and leave you to it, but they also wrap git things so that your changes stay synced across all your computers
  * If a git thing is breaking, manually inspect the situation in `$HOME/.local/share/thoughts`
* If you post a thought that contains HTML outside of a `<block>` tag, that HTML will definitely render in the browser. It might work, or it might break. Experiment!

## Future

There's no future -- Thoughts is probably feature complete. Only bug fixes and portability improvements from now on :)

<3
