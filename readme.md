# Outrageously simple touch ID command line prompter

Touch ID Command Line Interface (tidcli) simply pops a Touch ID prompt.

It returns an exit code of 0 on success and 1 on failure.

You can use this to embed additional authentication steps into your shell script or the like.

<img width="372" alt="image" src="https://github.com/singe/tidcli/assets/1150684/999a9a41-75d6-4366-b97b-ee6b425e1c1e">

# Usage

`tidcli [optional prompt context]`

Optional custom prompt information can be passed as the first argument. This is limited to 100 characters.

An example of using it in a bash shell script to exit if there is an authentication failure is:

```
tidcli "EXAMPLE SCRIPT"
if [[ "$?" -ne 0 ]]; then
  exit 1
fi
```

# Building

Build a release binary with swift by running:

`swift build -c release`

The resulting binary will be in the `.build/release` directory as `tidcli`.

# Notes

## Password fallback not allowed

The Touch ID prompt will contain a "Use Password" button, but only biometric authentication is allowed, so clicking it will result in an authentication failure. If you wanted to change this you could use `.deviceOwnerAuthentication` instead of `.deviceOwnerAuthenticationWithBiometrics`.

## Output on standard error

Success and failure messages are output to standard error.
