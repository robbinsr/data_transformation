for(i in 1:length(variableNames)){
        print("E")
        print("Outer2")
        if(!grepl("[b][a][n][d][s][E][n][e][r][g][y]",variableNames[i])){
                if(grepl("[B][o][d][y][G][y][r][o]",variableNames[i])){
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

for(n in 1:length(variableNames)){
        if(grepl("[A][A]",variableNames[n])==TRUE){
                variableNames[n]<-gsub("AA","A", variableNames[m])
                assign("variableNames",variableNames,.GlobalEnv)
        }
}