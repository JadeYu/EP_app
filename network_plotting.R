#pmi = read.csv("pmi_matrix.csv",header=T)[,-1]
#node_size = read.csv("node_weight.csv")[,2]
#library(igraph)

## Set up a threshold for pmi and only links with pmi values bigger than this will be shown
plot_network <- function(pmi,ngroup,threshold,node_size,gn,relation="pos"){
	pmi <- pmi[1:ngroup,1:ngroup]
	node_size <- node_size[1:ngroup]
	gn <- gn[1:ngroup]
	diag(pmi) = 0
	if(relation=="pos"){
		pmi[pmi<threshold] = 0
		colors = heat.colors(ngroup)
	}else{
		pmi[pmi>threshold] = 0
		pmi = -pmi
		colors = topo.colors(ngroup)
	}
	connected = colSums(pmi)*rowSums(pmi)>0
	pmi = pmi[connected,connected]
	node_size <- node_size[connected]
	gn = gn[connected]
	AJ = as.matrix(pmi*10)
			net=graph.adjacency(AJ,mode="undirected",weighted="width",diag=F)
	connectance = colSums(pmi)
	V(net)$color = colors[match(connectance,sort(connectance,decreasing=T))]
	V(net)$size = rescale(node_size^0.5,c(3,7))
	label_size = rescale(connectance,c(1,2.5))
	set.seed(2)
	par(bg="white",mar=rep(0,4))
		plot.igraph(net,vertex.label=gn,vertex.frame.color=0,vertex.label.cex=label_size,vertex.label.color="black",edge.color=colors[10],edge.width=E(net)$width*2)
}

rescale <- function(x_seq,span){
	(x_seq-min(x_seq))/(max(x_seq)-min(x_seq))*(span[2]-span[1])+span[1]
}




