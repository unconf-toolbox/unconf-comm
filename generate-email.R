generate_email <- function(name, message = c("apply", "accept", "decline")){
  
  match.arg(message)
  file <- paste0("text-templates/", message, ".txt")
  header <- "<h2> <img src = {logo} height = 50, width = 50, style = 'vertical-align:text-bottom'> {event_name} </h2>"
  footer <- "<a href = '{event_link}' >{event_name}</a><p> Email sent on {current_date_time}. </p>"
  
  msg_body <- paste(readLines(file), collapse = "\n")
  
  msg <- compose_email(
    body = paste(header, "<p>", msg_body),
    footer = footer,
    name = name
  )
  
  return(msg)
  
}