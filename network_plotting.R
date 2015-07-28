group_names = read.csv("Top50group_names.csv",header=T)
names0 = group_names[,4]
# Short cut for the group names
shortcut0 = c("Jokes&Riddles","Dream","The other woman","Single","Lesbian","Confession","Answer any question",'Poetry',"Sexless marriage","Anxiety","Curious","Random Thoughts","Movies","Human Behavior","Think too much","Make friends","Depression","Need talk","Music","Bored","Good quote","Good quote","Ten word story","Lonely","Depressed","God","Affair","Lyrics","Song","Pictures","Christian","Military girlfriend","Love didn't love me","Weird humor","Cut myself","Am I attractive","Writing","New member","Depression&loneliness","Lose weight","Photography","Atheist","Bi","Anything you ask","Quotes","Kik-messenger","Gamer","Gay","Workplace mobbing","Limericks")

## Read in the user-group matrix
matrix0 = as.matrix(read.table("ugBinMat_top50_AllData.txt",header=F))

## Subsample from the top 50
nsample = 50
matrix = matrix0[,1:nsample]
names = names0[1:nsample]
shortcut = shortcut0[1:nsample]

## Calculate cooccurence (pmi) matrix
cooccur = crossprod(matrix)
freq = diag(cooccur)
for(i in 1:dim(cooccur)[1]){
	cooccur[,i] = cooccur[,i]/freq[i]
}
dimnames(cooccur) = list(shortcut,shortcut)

## Set up a threshold for pmi and only links with pmi values bigger than this will be shown
AJ = 1*(cooccur>0.1)

## Build the network and plot the result
net = network(AJ,directed=F,matrix.type="adjacency")

png(paste("Network_plot_top",nsample,".png",sep=""),height=400,width=500)
set.seed(1)
#par(mar=rep(0,4))
plot(net,cex=10,label=shortcut)
dev.off()

##Alternative method
net=graph.adjacency(AJ,mode="undirected",weighted=NULL,diag=FALSE)

# More cosmetics can be done if we have other variables to show as color/node size.
#V(net)$color=gsub("F","red",V(net)$color) #Females will be red
#V(net)$color=gsub("M","blue",V(net)$color) #Males will be blue

# For now I just used random colors
V(net)$color = rbinom(nsample,20,0.5)
V(net)$size = rep(5,nsample)
png(paste("Network_plot_top",nsample,"_color.png",sep=""),height=500,width=700)
set.seed(1)
plot.igraph(net,vertex.label=shortcut)

#,layout=layout.fruchterman.reingold
dev.off()

