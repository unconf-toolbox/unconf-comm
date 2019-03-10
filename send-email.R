library(blastula)
library(purrr)
source("config.R")
source("email-fx.R")

# sample data (obviously point to yours!) ----
send_to <- data.frame(
  name = c("Person1", "Person2", "Person3"),
  email = c("a@b.com", "b@c.com", "c@d.com"),
  message = c("accept", "decline", "accept"),
  stringsAsFactors = FALSE
)

# generate emails ----
emails <- map2( send_to$name, send_to$message, generate_email )

# check a couple of emails for quality control ----
preview_email(emails[[1]])
preview_email(emails[[2]])


# send emails ----
# this step will depend on your specific email set-up!
# see https://github.com/rich-iannone/blastula for the most up-to-date set-up information

pwalk( 
  list(email_object = emails,
       email_to, send_to$email,
       subject = create_subject(send_to$message)),
  send_email,
  email_from = event_email
  )