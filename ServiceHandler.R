install.packages("httr")
library(httr)

serviceNames <- c("sessionserver.mojang.com", "authserve.mojang.com", "textures.minecraft.net", "api.mojang.com")

state <- {
  # does nothing yet
}

startTime <- { Sys.time() }

updateServer <- function(name, status){
  for(in in serviceNames){
    if(name != name[in]){
      print("Service name is not valid! ( " + name[in] + ")")
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
