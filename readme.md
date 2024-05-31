# Outrageously simple touch ID command line prompter

TouchID CLI (tidcli) simply pops a TouchID prompt.
It returns an exit code of 0 on success and 1 on failure.

You can use this to embed additional authentication steps into your shell script or the like.

Custom prompt information can be passed as the first argument.

<img width="372" alt="image" src="https://github.com/singe/tidcli/assets/1150684/999a9a41-75d6-4366-b97b-ee6b425e1c1e">


# Building

Build a release binary with swift by running:

`swift build -c release`

The resulting binary will be in the `.build/release` directory as `tidcli`.
