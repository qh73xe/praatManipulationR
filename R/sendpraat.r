#'@param praat command
#'@return None
#'@export
sendPraat.cmd <- R6Class("sendPraat.cmd",
                  public = list(
                    cmd.stacked = NA,
                    initialize = function(...) {
                      self$cmd.stacked==NA
                      system('praat &')
                    },
                    stack = function(cmd) {
                      if(is.na(self$cmd.stacked)){
                        self$cmd.stacked <- paste0("sendpraat praat '", cmd, "'")
                      }else{
                        self$cmd.stacked <- c(self$cmd.stacked, paste0("sendpraat praat '", cmd, "'"))                        
                      }
                    },
                    remove = function(){
                      self$cmd.stacked <- self$cmd.stacked[-1] 
                    },
                    do = function(){
                      if(!is.na(self$cmd.stacked)){
                        for (cmd in list(self$cmd.stacked)){
                          system(cmd)
                        }
                      }
                    }                    
                  )
)