# Comparative Vertebrate Brain Development #

#The point of this project is explore the comparative timelines of vertebrate brain development.

# Import dataset
#Copy and paste from `brainDevMilestones.xlsx`:  

brainDev = read.delim(pipe("pbpaste"))
brainDev$Species  <- factor(brainDev$Species,as.character(brainDev$Species))  #this will reorder the factor based on the row order we had in the dataframe (instead of by alphabetical order as is the default)

require(ggplot2)

p <- ggplot(brainDev,aes(time.gestation.days,Species))
p <- p + geom_segment(aes(xend = 0, yend = Species),size=1)
p <- p + geom_point(aes(vision.onset.days,Species),size=3,colour="deepskyblue") + theme_bw()
p + geom_point(aes(L5.ng.start,Species),shape="|",size=3,colour="red") + geom_point(aes(L2.3.ng.start,Species),shape="|",size=3,colour="red")

ggsave(file=paste("vertebrateBrainDevelopmentTimeline", format(Sys.time(),"%y%m%d-%H%M%S"), ".pdf",sep=""))
ggsave(file=paste("vertebrateBrainDevelopmentTimeline", format(Sys.time(),"%y%m%d-%H%M%S"), ".png",sep=""))
