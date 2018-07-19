install.packages("httr")
install.packages("jsonlite")
library(httr)
library(jsonlite)

serviceNames <- c("sessionserver.mojang.com", "authserve.mojang.com", "textures.minecraft.net", "api.mojang.com")

state <- {
  # does nothing yet
}

startTime <- { Sys.time() }

updateServer <- function(name, status){
  for(ii in serviceNames){
    if(name != name[ii]){
      print("Service name is not valid! ( " + name[ii] + ")")
    } else {
      status <- ""
      if(GET(name)[status] == "OK"){
        state = "Online"
      } else if(GET(name)[status] == "UNSTABLE"){
        state = "Unstable"
      } else if(GET(name)[status] == "OFFLINE"){
        state = "Offline"
      } else {
        state = "Cannot retrieve information"
      }
    }
  }
}

checkOnline <- function(error, res, body){
  if(error){
    print("An error has occured while checking the online status")
  } else {
    tryCatch({
      body = jsonlite::toJSON(body)
      
      for(i in body){
        service <- body[i]
        if(name = service){
          updateServer(name, service[name])
        }
      }
    })
  }
}
