PraatLauncher <- R6Class("PraatLauncher",
                         public = list(
                           wavDir = NA,
                           textGridDir = NA,
                           initialize = function(wavDir, textGridDir) {
                             if (!missing(wavDir)) self$wavDir <- wavDir
                             if (!missing(textGridDir)) self$textGridDir <- textGridDir
                             },
                           launcher = function(fileName.wav, fileName.textGrid, strTime, endTime, praat=T){
                             if(praat == T){
                               p <- praat.cmd()
                             }
                             wav = paste(self$wavDir, fileName.wav, sep='/')
                             wav = paste('', wav, '', sep='"')
                             textGrid = paste(self$textGridDir, fileName.textGrid, sep='/')
                             textGrid = paste('', textGrid, '', sep='"')
                             #p$stack(paste('Read from file:', wav))
                             p$stack(paste('Read from file:', textGrid))
                             return(p)
                           },
                           greet = function() {
                             cat(paste0("Open Praat !\n"))
                           }
                           )
                         )

pl <- PraatLauncher$new('/home/qh73xe/Documents/proj/sen1/wav', '/home/qh73xe/Documents/proj/sen1/textGrid')
p <- pl$launcher('1.WAV', '1.TextGrid', 0, 1)
p$do()
for(cmd in list(p$stacked)){
  print(cmd)
  system(cmd)
}