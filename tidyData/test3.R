variables<-read.table("features.txt", sep="", header=FALSE)
print("A")
variableNames<-character(0)

print("B")
variableNames<-as.character(variables[,2])

print("C")
assign("variableNames",variableNames,.GlobalEnv)
print("D")


for(i in 1:length(variableNames)){
        print("E")
        if(grepl("[b][a][n][d][s][E][n][e][r][g][y]",variableNames[i]))
        {
                print("F")
                x<-variableNames[i]
                assign("x",x,.GlobalEnv)
                print("G")
                variableNames[i]<-paste(variableNames[i],"A", sep="")
                
                print("H")
                for(j in 1:length(variableNames)){
                        print("I")
                        if(identical(variableNames[j],x))
                        {
                                print("J")
                                y<-variableNames[j]
                                print("K")
                                assign("y",y,.GlobalEnv)
                                variableNames[j]<-paste(variableNames[j],"B", sep="")
                                
                                print("L")
                                for(k in 1:length(variableNames)){
                                        print("M")
                                        if(identical(variableNames[k],y)){
                                                print("N")
                                                variableNames[k]<-paste(variableNames[k],"C", sep="")
                                                print("O")}
                                }
                                
                        }
                }
                
                
                
        }
        
}


}

}

for(l in 1:length(variableNames)){
        if(grepl("[C][B][A]",variableNames[l])==TRUE){
                variableNames[l]<-gsub("CBA","C", variableNames[l])
        }
}
for(m in 1:length(variableNames)){
        if(grepl("[B][A]",variableNames[m])==TRUE){
                variableNames[m]<-gsub("BA","B", variableNames[m])
        }
}
for(n in 1:length(variableNames)){
        if(grepl("[C][A]",variableNames[n])==TRUE){
                variableNames[n]<-gsub("CA","C", variableNames[m])
        }
}
##########################################################################

for(i in 1:length(variableNames)){
        print("E")
        print("Outer2")
        if(!grepl("[b][a][n][d][s][E][n][e][r][g][y]",variableNames[i])){
                if(grepl("[B][o][d][y][A][c][c]",variableNames[i])){
                        print("First2")
                        x<-variableNames[i]
                        assign("x",x,.GlobalEnv)
                        print("G")
                        variableNames[i]<-paste(variableNames[i],"A", sep="")
                        assign("variableNames",variableNames,.GlobalEnv)
                        
                        print("H")
                        for(j in 1:length(variableNames)){
                                print("Middle2")
                                if(identical(variableNames[j],x)){
                                        print("Second2")
                                        
                                        y<-variableNames[j]
                                        print("K")
                                        assign("y",y,.GlobalEnv)
                                        variableNames[j]<-paste(variableNames[j],"B", sep="")
                                        assign("variableNames",variableNames,.GlobalEnv)
                                        
                                        print("L")
                                        for(k in 1:length(variableNames)){
                                                print("Inner2")
                                                if(identical(variableNames[k],y)){
                                                        print("Third2")
                                                        z<-variableNames[k]
                                                        print("M")
                                                        assign("y",y,.GlobalEnv)
                                                        variableNames[j]<-paste(variableNames[j],"C", sep="")
                                                        assign("variableNames",variableNames,.GlobalEnv)
                                                }
                                                
                                        }
                                }
                                
                                
                                
                        }
                        
                }
        }
        
        
}

for(l in 1:length(variableNames)){
        if(grepl("[C][B][A]",variableNames[l])==TRUE){
                variableNames[l]<-gsub("CBA","C", variableNames[l])
                assign("variableNames",variableNames,.GlobalEnv)
        }
}
for(m in 1:length(variableNames)){
        if(grepl("[B][A]",variableNames[m])==TRUE){
                variableNames[m]<-gsub("BA","B", variableNames[m])
                assign("variableNames",variableNames,.GlobalEnv)
        }
}
for(n in 1:length(variableNames)){
        if(grepl("[C][A]",variableNames[n])==TRUE){
                variableNames[n]<-gsub("CA","C", variableNames[m])
                assign("variableNames",variableNames,.GlobalEnv)
        }
}

for(z in 1:length(variableNames)){
        print("variableNames(z)")
        print(variableNames(z))
}

for(o in 1:length(variableNames)){
        if(grepl("[A]$",variableNames[o])==TRUE){
                print("variableNames[o]")
                print(variableNames[o])
                len<-nchar(variableNames[o])
                print("len")
                print(len)
                
                temp<-variableNames[o]
                
                print("temp")
                print(temp)
                
                print("len-1")
                print(len-1)
                
                variableNames[o]<-substr(temp, 1, (len-1))
                
                print("variableNames[o]")
                print(variableNames[o])
                
                target<-paste(variableNames[o],"B",sep="")
                print("target")
                print(target)
                for(n in 1:length(variableNames)){
                        
                        if(grepl("target",variableNames[n])==FALSE){
                                variableNames[o]<-substring(target,1,length(target)-1)
                                print("variableNames[o]")
                                print(variableNames[o])
                               
                                
                        }
                }
                
        }
        
}

write.table(variableNames,"fixedBVariableNames.txt", sep=" ", quote=FALSE)         
print("EE")


