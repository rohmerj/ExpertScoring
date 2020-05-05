###### CAL COOKE
calFUN_classical<-function(param,seed,p=c(0.05,0.45,0.45,0.05)){

	N<-length(seed)
	s<-NULL
	s[1]<-length(which(seed<=param[,1]))/N	
	for (j in 2:3){
		s[j]<-length(which(seed<=param[,j] & seed > param[,j-1]))/N
	}
	s[4]<-length(which(seed>param[,3]))/N	

	ii<-NULL
	for (j in 1:4){
		if (s[j]>0){
			ii[j]<-s[j]*log(s[j]/p[j])
		}else{
			ii[j]<-0
		}
	}	
	I<-sum(ii)
	(cal<-1-pchisq(2*N*I,df=3))

	return(list(cal=cal,s=s))	

}

###### IMP COOKE
impFUN_classical<-function(param,u,l,p=c(0.05,0.45,0.45,0.05)){

	I<-0

	nseed<-nrow(param)

	for (ss in 1:nseed){

		q95<-param[ss,3]
		q5<-param[ss,1]
		q50<-param[ss,2]	
		q0<-l[ss]
		q100<-u[ss]

	s<-c(
		(q5-q0)/(q100-q0),
		(q50-q5)/(q100-q0),
		(q95-q50)/(q100-q0),
		(q100-q95)/(q100-q0)
	)

	ii<-NULL
	for (j in 1:4){
		if (s[j]>0){
			ii[j]<-p[j]*log(p[j]/s[j])
		}else{
			ii[j]<-0
		}
	}	
	I<-I+sum(ii)

	}##seed

	I<-I/nseed

	return(I)	
}



