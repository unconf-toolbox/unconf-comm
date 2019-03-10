# event-related metadata (CHANGE THESE) ----
logo <- "https://raw.githubusercontent.com/chirunconf/chirunconf19/master/img/logo.png"
button <- add_cta_button("google.com", "Click Here", align = "center")
event_name <- "Chicago R Unconference"
event_loc <- "The XXX Building on the YYY Campus (123 N Street)"
event_link <- "https://chirunconf.github.io"
event_email <- "chirunconf@gmail.com"

date_event <- "the weekend of March 9-10"
date_appl <- "5PM on March 10th"
date_rsvp <- "5PM on April 10th"

link_appl <- "www.google.com"
link_rsvp <- "www.google.com"
link_wait <- "www.google.com"
link_gith <- "www.google.com"
link_slck <- "www.google.com"


# logic ----
library(blastula)

current_date_time <- add_readable_time()
button_appl <- if(!is.na(link_appl)) add_cta_button(link_appl, "Go to Applicaiton", align = "center") else ""
button_rsvp <- if(!is.na(link_rsvp)) add_cta_button(link_rsvp, "Go to RSVP", align = "center") else ""
button_wait <- if(!is.na(link_wait)) add_cta_button(link_wait, "Go to Waitlist", align = "center") else ""
button_gith <- if(!is.na(link_gith)) add_cta_button(link_gith, "Go to GitHub", align = "center") else ""
button_slck <- if(!is.na(link_slck)) add_cta_button(link_slck, "Go to Slack", align = "center") else ""