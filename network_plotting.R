#pmi = read.csv("pmi_matrix.csv",header=T)[,-1]
#node_size = read.csv("node_weight.csv")[,2]
#library(igraph)

## Set up a threshold for pmi and only links with pmi values bigger than this will be shown
plot_network <- function(pmi,ngroups,threshold,node_size,relation="posi"){
	pmi <- pmi[1:ngroups,1:ngroups]
	diag(pmi) = 0
	if(relation=="posi"){
		pmi[pmi<threshold] = 0
		colors = heat.colors(ngroups)
	}else{
		pmi[pmi>threshold] = 0
		pmi = -pmi
		colors = topo.colors(ngroups)
	}
	node_size <- node_size[1:ngroups]
	AJ = as.matrix(pmi*10)
			net=graph.adjacency(AJ,mode="undirected",weighted="width",diag=F)
	connectance = colSums(pmi)
	V(net)$color = colors[match(connectance,sort(connectance,decreasing=T))]
	V(net)$size = 1.2*node_size^0.4
	set.seed(1)
	par(bg="gray",mar=rep(0,4))
		plot.igraph(net,vertex.label=names(pmi),vertex.label.cex=1.5,vertex.label.color="black",edge.color=colors[5],edge.width=E(net)$width*2)
}





