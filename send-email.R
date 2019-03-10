library(blastula)
library(purrr)
source("config.R")
source("generate_email.R")

# sample data (obviously point to yours!) ----
send_to <- data.frame(
  name = c("Person1", "Person2", "Person3"),
  email = c("a@b.com", "b@c.com", "c@d.com"),
  message = c("accept", "decline", "accept"),
  stringsAsFactors = FALSE
)

emails <- map2( send_to$name, send_to$message, generate_email )

preview_email(emails[[1]])
preview_email(emails[[2]])
