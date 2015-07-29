#pmi = read.csv("pmi_matrix.csv",header=T)[,-1]
#node_size = read.csv("node_weight.csv")[,2]
#library(igraph)

## Set up a threshold for pmi and only links with pmi values bigger than this will be shown
plot_network <- function(pmi,ngroups,threshold,node_size){
	pmi <- pmi[1:ngroups,1:ngroups]
	pmi[pmi<threshold] = 0
	node_size <- node_size[1:ngroups]
	AJ = as.matrix(pmi*10)
			net=graph.adjacency(AJ,mode="undirected",weighted="width",diag=F)
	V(net)$color = sample(c(2:3,5:8,10:13),ngroups,replace=T)
	V(net)$size = 1.2*node_size^0.4
	set.seed(1)
	par(bg="gray",mar=rep(0,4))
		plot.igraph(net,vertex.label=names(pmi),vertex.label.cex=1.5,vertex.label.color="black",edge.color="red",edge.width=E(net)$width*2)
}





