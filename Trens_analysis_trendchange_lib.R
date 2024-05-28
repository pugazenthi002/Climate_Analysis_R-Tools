library(readxl)
library(trendchange)

inn="C:/Users//rffdata/seasonal/" 
outt= "C://rffdataoutseasonal/"


filee=list.files(inn)
for(i in 1:length(filee)){
  filename = filee[[i]]
  y<-tools::file_path_sans_ext(filename)
  
  out2<- paste(outt,y,".txt",sep="")
  sink(out2,append=FALSE)
  
  innn=paste(inn,filename,sep = "")
  
  vt<-read_excel(innn)
  
  for (i in colnames(vt)){
    if (names(vt[,i]) == "year")
    {}
    else {
      invtd<-innovtrend(vt[[i]],ci=95)
      print(names(vt[,i]))
      print(invtd)}
  }
  sink()  
}
