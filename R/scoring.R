########################################################
#### 06/05/20
#### author: Jeremy Rohmer, BRGM
#### estimation of calibration and informativeness score
#### using the possibilistic approach by Destercke & Chojnacki (2008)
#### using the classical model by Cooke (1991)
########################################################

scoring<-function(data_expert,data_seed,q){

	(nexpert<-unique(data_expert[,1]))
	(nseed<-nrow(data_seed))

	u<-data_seed$u
	l<-data_seed$l

	p<-switch(as.integer(q),
		c(0.05,0.45,0.45,0.05),
		c(0.10,0.40,0.40,0.10),
		c(0.01,0.49,0.49,0.01)
	)

	cal_classical<-imp_classical<-imp_possi<-cal_possi<-NULL
	Ipossi<-Cpossi<-matrix(0,max(nexpert),nseed)

	ee<-0

	for (e in nexpert){

		ee<-ee+1

		qui<-which(data_expert$id==e)
		param<-matrix(unlist(data_expert[qui,c("q1","q2","q3")]),nc=3)
		seed<-data_seed$val

		cal_classical[ee]<-calFUN_classical(param,seed,p=p)$cal
		imp_classical[ee]<-impFUN_classical(param,u,l,p=p)

		for (j in 1:nseed){
			Cpossi[ee,j]<-calFUN_possi(param[j,],seed[j])
			Ipossi[ee,j]<-impFUN_possi(param[j,],u[j],l[j])
		}
		cal_possi[ee]<-mean(Cpossi[ee,])
		imp_possi[ee]<-mean(Ipossi[ee,])

	}

	my_list<-list(cal_possi=cal_possi,cal_classical=cal_classical,imp_possi=imp_possi,imp_classical=imp_classical)

return(my_list)

}