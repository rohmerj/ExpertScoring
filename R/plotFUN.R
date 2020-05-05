plotFUN_seed<-function(data_expert,data_seed,choix){

	qui<-which(data_expert[,"var"]==choix)
	E<-data_expert[qui,]
	S<-data_seed$val[choix]
	ne<-length(unique(E$id))

	plot(0,0,
		axes=F,
		xlab="",ylab="",
		xlim=c(min(E$q5)*0.90,max(E$q95)*1.1),
		ylim=c(1-0.5,ne+0.5),
		main=paste("seed",choix,sep="")
	)
	for (ii in 1:ne){
		lines(c(E$q5[ii],E$q95[ii]),c(ii,ii))
		points((unlist(E$q50[ii])),ii,pch=15,cex=1.25)
	}
	abline(v=S,lwd=2,col=2,lty=2)
	axis(2, at = 1:ne, labels = paste("Ex",1:ne,sep=""),cex.axis=1.25,lwd=1.25)
	axis(1)

}

plotFUN_possi<-function(param,seed,u,l,add=FALSE){
	if (add==FALSE){
	plot(c(param[1],param[2]),c(0,1),ty="l",xlim=c(u,l),ylim=c(0,1),lwd=4,xlab="",ylab=expression(pi),cex.lab=1.5,cex.axis=1.5)
	lines(c(param[2],param[3]),c(1,0),ty="l",xlim=c(u,l),ylim=c(0,1),lwd=4)
	abline(h=0,lty=2)
	abline(v=seed,lty=2,lwd=2,col=2)
	}
}

plotFUN_resu_cal<-function(cal_cooke,cal_possi){

	expert<-1:length(cal_cooke)
	  cc<-(cal_cooke-min(cal_cooke))/diff(range(cal_cooke))
	  cp<-(cal_possi-min(cal_possi))/diff(range(cal_possi))
	  a<-barplot(rbind(cc,cp),
	          beside=T,col=c("skyblue","tomato"),
	          main="Calibration",ylab="Normalised Cal.",xlab="Expert #",
	          names.arg=paste("Ex",expert),cex.axis=1.5,cex.lab=1.5,cex.names=1.5,ylim=c(0,1.25))
	  legend("topleft",c("Classical","Possibility"),col=c("skyblue","tomato"),bty = "n",pch=15)
	  maxi<-which.max(cc)
	  mini<-which.min(cc)
	  text(a[1,maxi],cc[maxi]+.1,"1st",cex=1.1)
	  text(a[1,mini],cc[mini]+.1,"last",cex=1.1)
	  maxi<-which.max(cp)
	  mini<-which.min(cp)
	  text(a[2,maxi],cp[maxi]+.1,"1st",cex=1.1)
	  text(a[2,mini],cc[mini]+.1,"last",cex=1.1)
}

plotFUN_resu_imp<-function(imp_cooke,imp_possi){

	  expert<-1:length(imp_cooke)
	  ic<-(imp_cooke-min(imp_cooke))/diff(range(imp_cooke))
	  ip<-(imp_possi-min(imp_possi))/diff(range(imp_possi))
	  a<-barplot(rbind(ic,ip),
	          beside=T,col=c("skyblue","tomato"),
	          main="Informativeness",ylab="Normalised Inf.",xlab="Expert #",
	          names.arg=paste("Ex",expert),cex.axis=1.5,cex.lab=1.5,cex.names=1.5,ylim=c(0,1.25))
	  legend("topleft",c("Classical","Possibility"),col=c("skyblue","tomato"),bty = "n",pch=15)
	  maxi<-which.max(ic)
	  mini<-which.min(ic)
	  text(a[1,maxi],ic[maxi]+.1,"1st",cex=1.1)
	  text(a[1,mini],ic[mini]+.1,"last",cex=1.1)
	  maxi<-which.max(ip)
	  mini<-which.min(ip)
	  text(a[2,maxi],ip[maxi]+.1,"1st",cex=1.1)
	  text(a[2,mini],ip[mini]+.1,"last",cex=1.1)
}