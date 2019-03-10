generate_email <- function(name, message = c("apply", "accept", "decline")){
  
  match.arg(message)
  file <- paste0("templates/", message, ".txt")
  header <- "<h2> <img src = {logo} height = 50, width = 50, style = 'vertical-align:text-bottom'> {event_name} </h2>"
  footer <- "<a href = '{event_link}' >{event_name}</a><p> Email sent on {current_date_time}. </p>"
  
  msg_body <- paste(readLines(file), collapse = "\n")
  
  msg <- blastula::compose_email(
    body = paste(header, "<p>", msg_body),
    footer = footer,
    name = name
  )
  
  return(msg)
  
}

send_email <- function(email_object, email_to, email_from, subject){
  
  blastula::smtp_send(
    message = email_object,
    from = email_from,
    to = email_to,
    subject = subject,
    creds_file = ".email_creds"
  )
  
}

create_subject <- function(message, event = event_name){
  
  subject_fx <- function(message) {
                  switch(message,
                    apply = paste("Applications are open for", event),
                    accept = paste("Congratulations! You've been accepted to", event),
                    decline = paste("Decision on your", event, "application")
                    )
  }
  
  subjects <- vapply(message, FUN = subject_fx, FUN.VALUE = character(1))
  
  return(subjects)
  
  
}
