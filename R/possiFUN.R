########################################################
#### 06/05/20
#### author: Jeremy Rohmer, BRGM
#### estimation of calibration and informativeness score
#### using the possibilistic approach by Destercke & Chojnacki (2008)
########################################################

###### CALIBRATION SCORE
calFUN_possi<-function(param,h){
	if (h<=param[2] & h>=param[1]){
		y<-approx(x=param[1:2], y = c(0,1), xout=h)$y
	}
	if (h<=param[3] & h>=param[2]){
		y<-approx(x=param[2:3], y = c(1,0), xout=h)$y
	}
	if (h<param[1]){
		y<-0
	}
	if (h>param[3]){
		y<-0
	}
	return(y)
}

###### INFORMATIVENESS SCORE
impFUN_possi<-function(param,u,l){
	support=param[3]-param[1]
	universe<-u-l
	return(1-(support)/(2*universe))	
}