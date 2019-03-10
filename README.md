# unconf-comm

Set-up email communications with unconference participants, using the [`blastula`](https://github.com/rich-iannone/blastula) package for aesthetic HTML emails.

## Repo overview

Files to use:

- `config.R`: Edit this file with metadata specific to your unconference (links, logo, names, dates, etc.)
- `send-email.R`: Point this file to a dataframe of participants and run it to create your emails

Files you shouldn't have to change:

- `templates`: Contains common templates for unconf communication. 
    + Current contains email for: application reminder (`apply.txt`) and application decisions (`accept.txt`, `reject.txt`)
    + Additional desired templates are: logistics, reminder, post-unconference follow-up
- `email-fx.R`: Defines needed email functions called via `source()` by `send-email.R`
    + `generate_email()`: Generates email based on desired parameters
    + `send_email()`: Wrapped around `blastula` function

## Contributing

To contribute a new email template to this repository, please ensure the following changes are made:

- Review how the [`blastula`](https://github.com/rich-iannone/blastula) package works for correct syntax
- Add your new template to the `templates/` folder. Ensure any variables referenced with `{}` are collected in the `config.R` file
- Making the following edits to `email-fx.R`:
    + Ensure the `generate_email()` function so that your template is accepted by `match.args` as a valid value for `message`
    + Add to the `switch()` statement in the `create_subject()` function so that your template triggers a valid email subject