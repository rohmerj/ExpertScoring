########################################################
#### 06/05/20
#### author: Jeremy Rohmer, BRGM
#### plot function of calibration and informativeness scores
#### using the possibilistic approach by Destercke & Chojnacki (2008)
#### using the classical model by Cooke (1991)
########################################################

###### CALIBRATION SCORE
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

###### INFORMATIVENESS SCORE
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