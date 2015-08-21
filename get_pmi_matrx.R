counts = as.matrix(read.table("../ugBinMat_top50_AllData.txt"))
pmi = cooccur = crossprod(counts)
for(i in 1:dim(cooccur)[1]){
	for(j in 1:dim(cooccur)[2]){
		if(cooccur[i,j]==0){
			pmi[i,j] = -1
		}else{
			pij = cooccur[i,j]/dim(counts)[1]
			pi = cooccur[i,i]/dim(counts)[1]
			pj = cooccur[j,j]/dim(counts)[1]
			pmi[i,j] = -log(pij/pi/pj)/log(pij)
		}
	}
}

old = read.csv("pmi_matrix.csv",header=T)[,-1]
colnames(pmi) = names(old)
write.csv(pmi,"pmi_matrix.csv")