library(SPEI)
library(readr)

inn="C:/Users/ACRC/Desktop/CFS_verification/SPI/forecasted/NE/" 
out="C:/Users/ACRC/Desktop/CFS_verification/SPI/forecasted_spi_NE/" 

filee=list.files(inn)
print (filee)
for(i in 1:length(filee)){
  filename = filee[[i]]
  y<-tools::file_path_sans_ext(filename)
  
  out2<- paste(out,y,"spi.txt",sep="")
  sink(out2,append=FALSE)
  innn=paste(inn,filename,sep = "")
  
  
  df=read_table(innn, skip = 2, col_names = FALSE, col_types = cols(X1 = col_date(format = "%Y-%m-%d"),X2 = col_double()))
  Data <- subset( df, select = -c(X1,X3 ) )
  Data[,'X2']=round(Data[,'X2'],2)
  s=data.matrix(Data)
  s <- cbind(YEAR = as.numeric(format(df$X1, "%Y")), MONTH = as.numeric(format(df$X1, "%m")), X2 = as.numeric(Data$X2))
  spi_gam <- spi(s[,"X2"],3, distribution = "Gamma")
  #plot(spi_gam)
  summary(spi_gam)

  sink()  

}
