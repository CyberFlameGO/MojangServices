install.packages("httr")
library(httr)

serviceNames <- c("sessionserver.mojang.com", "authserve.mojang.com", "textures.minecraft.net", "api.mojang.com")

updateServer <- function(name, status){
  for(in in serviceNames){
    if(name != name[in]){
      print("Service name is not valid! ( " + name[in] + ")")
    }
  }
}