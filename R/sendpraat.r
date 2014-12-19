#' praat.cmd
#' 
#' send cmd to praat from R
#'
#'@param praat command
#'@return None
#'@export
praat.cmd <- function(cmd){
  p <- R6Class("praat.cmd",
               public = list(
                 stacked = NA,
                 initialize = function(...) {
                   system('praat &')
                   self$greet()
                   },
                 stack = function(cmd){
                   if(is.na(self$stacked)){
                     self$stacked <- paste0("sendpraat praat '", cmd, "'")
                     }else{
                       self$stacked <- c(self$stacked, paste0("sendpraat praat '", cmd, "'"))
                     }
                   },
                 remove = function(){
                   self$stacked <- self$stacked[-1]
                   },
                 do = function(){
                   for (cmd in list(self$stacked)){
                     system(cmd)
                   }
                 },
                 greet = function() {
                   cat(paste0("Open Praat !\n"))
                 }
                 )
               )
  p <- p$new()
  return(p)
}