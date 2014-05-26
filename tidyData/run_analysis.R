#install.packages("doBy")
#require("doBy")

setActivityNamesByObs<-function(actsByObs){
        for(i in seq_along(actsByObs[,1])){
                actsByObs[i,1]<-gsub("1", "Walking", actsByObs[i,1])
                actsByObs[i,1]<-gsub("2", "Walking Up Stairs", actsByObs[i,1])
                actsByObs[i,1]<-gsub("3", "Walking Down Stairs", actsByObs[i,1])
                actsByObs[i,1]<-gsub("4", "Standing", actsByObs[i,1])
                actsByObs[i,1]<-gsub("5", "Sitting", actsByObs[i,1])
                actsByObs[i,1]<-gsub("6", "Lying", actsByObs[i,1])   
        }
        assign("actsByObs",actsByObs,.GlobalEnv)
        
        print("P")
        
}

#Define a function that reads data about observations, subjects attached to observations, activities attached to observations,
#activities performed by subjects, and variables captured or already created.
getData <- function(observationsFile, variablesFile, SubjectsByObjsFile, ActivitiesByObjsFile, activitiesFile){
        
        tempObservations<-read.table(observationsFile,sep="",header=FALSE)
        assign("tempObservations",tempObservations,.GlobalEnv)
        print("A")
        
        variables<-read.table(variablesFile, sep="", header=FALSE)
        print("B")
        
        variableNames<-character(0)
        print("C")
        
        variableNames<-as.character(variables[,2])
        assign("variableNames",variableNames,.GlobalEnv)
        print("D")
        
        tempSubjsByObs<-read.table(SubjectsByObjsFile,sep="", header=FALSE)
        assign("tempSubjsByObs",tempSubjsByObs,.GlobalEnv)
        print("E")
        
        tempActsByObs<-read.table(ActivitiesByObjsFile,sep="", header=FALSE)
        assign("tempActsByObs",tempActsByObs,.GlobalEnv)
        print("F")
        
        activityNames<-read.table(activitiesFile, sep="", header=FALSE)
        assign("activityNames",activityNames,.GlobalEnv)
        print("H")
        
        colnames(activityNames)<-c("Number","Name")
        print("I")
        
        
}




#Define a function that creates variable names that are more readable by a analyst.
clarifyVariableNames <- function (variableNames){
        tempVariableNames<-variableNames
        
        for(i in 1:length(tempVariableNames)){
                print("E")
                print("Outer")
                if(grepl("[b][a][n][d][s][E][n][e][r][g][y]",variableNames[i])){
                        print("First")
                        x<-variableNames[i]
                        assign("x",x,.GlobalEnv)
                        print("G")
                        variableNames[i]<-paste(variableNames[i],"A", sep="")
                        assign("variableNames",variableNames,.GlobalEnv)
                        
                        print("H")
                        for(j in 1:length(tempVariableNames)){
                                print("Middle")
                                if(variableNames[j]==x){
                                        print("Second")
                                        y<-variableNames[j]
                                        print("K")
                                        assign("y",y,.GlobalEnv)
                                        variableNames[j]<-paste(variableNames[j],"B", sep="")
                                        
                                        if(variableNames[j+14]==x){
                                                variableNames[j+14]<-paste(variableNames[j+14],"C", sep="")     
                                                
                                                assign("variableNames",variableNames,.GlobalEnv)
                                                
                                                print("L")
                                                for(k in 1:length(tempVariableNames)){
                                                        print("Inner")
                                                        if(variableNames[k]==variableNames[j]){
                                                                print("Third")
                                                                z<-variableNames[k]
                                                                print("M")
                                                                assign("z",z,.GlobalEnv)
                                                                variableNames[k]<-paste(variableNames[k],"C", sep="")
                                                                assign("variableNames",variableNames,.GlobalEnv)
                                                        }
                                                        
                                                }
                                        }
                                        
                                        
                                        
                                }
                                
                        }
                        
                        
                }
        }
        for(l in 1:length(tempVariableNames)){
                if(grepl("[C][B][A]",variableNames[l])==TRUE){
                        variableNames[l]<-gsub("CBA","C", variableNames[l])
                        assign("variableNames",variableNames,.GlobalEnv)
                }
        }
        for(m in 1:length(tempVariableNames)){
                if(grepl("[B][A]",variableNames[m])==TRUE){
                        variableNames[m]<-gsub("BA","B", variableNames[m])
                        assign("variableNames",variableNames,.GlobalEnv)
                }
        }
        for(n in 1:length(tempVariableNames)){
                if(grepl("[C][A]",variableNames[n])==TRUE){
                        variableNames[n]<-gsub("CA","C", variableNames[m])
                        assign("variableNames",variableNames,.GlobalEnv)
                }
        }
        
        for(i in 1:length(tempVariableNames)){
                print("E")
                print("Outer2")
                if(!grepl("[b][a][n][d][s][E][n][e][r][g][y]",variableNames[i])){
                        if(grepl("[A][c][c]",variableNames[i])){
                                print("First2")
                                x<-variableNames[i]
                                assign("x",x,.GlobalEnv)
                                print("G")
                                variableNames[i]<-paste(variableNames[i],"A", sep="")
                                assign("variableNames",variableNames,.GlobalEnv)
                                
                                print("H")
                                for(j in 1:length(tempVariableNames)){
                                        print("Middle2")
                                        if(identical(variableNames[j],x)){
                                                print("Second2")
                                                
                                                y<-variableNames[j]
                                                print("K")
                                                assign("y",y,.GlobalEnv)
                                                variableNames[j]<-paste(variableNames[j],"B", sep="")
                                                assign("variableNames",variableNames,.GlobalEnv)
                                                
                                                print("L")
                                                for(k in 1:length(tempVariableNames)){
                                                        print("Inner2")
                                                        if(isTRUE(all.equal(variableNames[k],variableNames[j]))){
                                                                print("Third2")
                                                                z<-variableNames[k]
                                                                print("M")
                                                                assign("z",z,.GlobalEnv)
                                                                variableNames[k]<-paste(variableNames[k],"C", sep="")
                                                                assign("variableNames",variableNames,.GlobalEnv)
                                                        }
                                                        
                                                }
                                        }
                                        
                                        
                                        
                                }
                                
                        }
                }
                
                
        }
        
        for(l in 1:length(tempVariableNames)){
                if(grepl("[C][B][A]",variableNames[l])==TRUE){
                        variableNames[l]<-gsub("CBA","C", variableNames[l])
                        assign("variableNames",variableNames,.GlobalEnv)
                }
        }
        for(m in 1:length(tempVariableNames)){
                if(grepl("[B][A]",variableNames[m])==TRUE){
                        variableNames[m]<-gsub("BA","B", variableNames[m])
                        assign("variableNames",variableNames,.GlobalEnv)
                }
        }
        for(n in 1:length(tempVariableNames)){
                if(grepl("[C][A]",variableNames[n])==TRUE){
                        variableNames[n]<-gsub("CA","C", variableNames[m])
                        assign("variableNames",variableNames,.GlobalEnv)
                }
        }
        
        for(n in 1:length(tempVariableNames)){
                if(grepl("[A][A]",variableNames[n])==TRUE){
                        variableNames[n]<-gsub("AA","A", variableNames[m])
                        assign("variableNames",variableNames,.GlobalEnv)
                }
        }
        
        for(i in 1:length(tempVariableNames)){
                print("E")
                print("Outer2")
                if(!grepl("[b][a][n][d][s][E][n][e][r][g][y]",variableNames[i])){
                        if(grepl("[G][y][r][o]",variableNames[i])){
                                print("First2")
                                x<-variableNames[i]
                                assign("x",x,.GlobalEnv)
                                print("G")
                                variableNames[i]<-paste(variableNames[i],"A", sep="")
                                assign("variableNames",variableNames,.GlobalEnv)
                                
                                print("H")
                                for(j in 1:length(tempVariableNames)){
                                        print("Middle2")
                                        if(identical(variableNames[j],x)){
                                                print("Second2")
                                                
                                                y<-variableNames[j]
                                                print("K")
                                                assign("y",y,.GlobalEnv)
                                                variableNames[j]<-paste(variableNames[j],"B", sep="")
                                                assign("variableNames",variableNames,.GlobalEnv)
                                                
                                                print("L")
                                                for(k in 1:length(tempVariableNames)){
                                                        print("Inner2")
                                                        if(isTRUE(all.equal(variableNames[k],variableNames[j]))){
                                                                print("Third2")
                                                                z<-variableNames[k]
                                                                print("M")
                                                                assign("z",z,.GlobalEnv)
                                                                variableNames[k]<-paste(variableNames[k],"C", sep="")
                                                                assign("variableNames",variableNames,.GlobalEnv)
                                                        }
                                                        
                                                }
                                        }
                                        
                                        
                                        
                                }
                                
                        }
                }
                
                
        }
        
        for(l in 1:length(tempVariableNames)){
                if(grepl("[C][B][A]",variableNames[l])==TRUE){
                        variableNames[l]<-gsub("CBA","C", variableNames[l])
                        assign("variableNames",variableNames,.GlobalEnv)
                }
        }
        for(m in 1:length(tempVariableNames)){
                if(grepl("[B][A]",variableNames[m])==TRUE){
                        variableNames[m]<-gsub("BA","B", variableNames[m])
                        assign("variableNames",variableNames,.GlobalEnv)
                }
        }
        for(n in 1:length(tempVariableNames)){
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
        
        for(i in 1:length(variableNames)){
                
                #transform      
                print("changed variable Name:")
                print(variableNames[i])
                variableNames[i]<-gsub("entropy","Decline", variableNames[i])
                variableNames[i]<-gsub("arCoeff","Coeff", variableNames[i])
                variableNames[i]<-gsub("^f","", variableNames[i])
                variableNames[i]<-gsub("^t","", variableNames[i])
                #variableNames[i]<-gsub("Body","", variableNames[i])
                variableNames[i]<-gsub("Acc","Acceleration", variableNames[i])
                variableNames[i]<-gsub("GravityAcceleration","GravitationalPull",variableNames[i])
                variableNames[i]<-gsub("GravityAcceleration","GravitationalPull",variableNames[i])
                variableNames[i]<-gsub("GyroThrust","RotationalVelocity",variableNames[i])
                variableNames[i]<-gsub("Gyro","Rotational",variableNames[i])
                variableNames[i]<-gsub("mean","Mean", variableNames[i])
                variableNames[i]<-gsub("correlation","Corr", variableNames[i])
                variableNames[i]<-gsub("Mag","Magnitude", variableNames[i])
                variableNames[i]<-gsub("mad","Median", variableNames[i])
                variableNames[i]<-gsub("bandsEnergy","EnergyInRange", variableNames[i])
                variableNames[i]<-gsub("angle","AngleBetweenVectors", variableNames[i])
                variableNames[i]<-gsub("sma","Magnitude", variableNames[i])
                variableNames[i]<-gsub("maxInds","MaxMagnitude", variableNames[i])
                variableNames[i]<-gsub("iqr","InterQuartileRange", variableNames[i])
                variableNames[i]<-gsub("AngleBetweenVectors","DirectionalChange", variableNames[i])
                variableNames[i]<-gsub("AccelerationThrust","Acceleration", variableNames[i])
                variableNames[i]<-gsub("std","StdDev", variableNames[i])
                variableNames[i]<-gsub("energy","Energy", variableNames[i])
                variableNames[i]<-gsub("max","Max", variableNames[i])
                variableNames[i]<-gsub("min","Min", variableNames[i])
                variableNames[i]<-gsub("-","",variableNames[i])  
                variableNames[i]<-gsub("[(]","",variableNames[i])
                variableNames[i]<-gsub("[)]","",variableNames[i])
                variableNames[i]<-gsub("WalkingUpWalkingUp","WalkingUp",variableNames[i])
                variableNames[i]<-gsub("DirectionalChangetAccelerationMean,gravityMean","DirectionalChangeInThrustRelativeToGravityMean",variableNames[i])
                variableNames[i]<-gsub("DirectionalChangetRotationalVelocityMean,gravityMean","DirectionalChangeThrustRotationalVelocityMeanRelativeToGravity",variableNames[i])
                variableNames[i]<-gsub(",gravity","RelativeToGravity",variableNames[i])
                variableNames[i]<-gsub("DirectionalChangeRotationalMeanRelativeToGravityMean","DirectionalChangetRotationalRelativeToGravityMean",variableNames[i])
                assign("variableNames",variableNames,.GlobalEnv)
                
        }
}


#Execute the getData function and pass it the appropriate files related to training.
getData("train/X_train.txt","features.txt","train/subject_train.txt", "train/y_train.txt", "activity_labels.txt")

setActivityNamesByObs(tempActsByObs)
print("nrow(tempActsByObs)")
print(nrow(tempActsByObs))
assign("tempActsByObs",tempActsByObs,.GlobalEnv)
print("G")

#Pass the observations, subjects by observation, and acts by observation data from temp to the appropriate data frames.
observations<-tempObservations
subjsByObs<-tempSubjsByObs
actsByObs<-tempActsByObs

print("actsByObs1:")
print(actsByObs)

print(class(observations))
print(class(subjsByObs))
print(class(actsByObs))

print("observations length is: ")
print(nrow(observations))
print("subjsByObs length is: ")
print(nrow(subjsByObs))
print("actsByObs length is: ")
print(nrow(actsByObs))

getData("test/X_test.txt","features.txt","test/subject_test.txt", "test/y_test.txt", "activity_labels.txt")
observations<-rbind(observations, tempObservations)
print("M")
subjsByObs<-rbind(subjsByObs, tempSubjsByObs)
print("N")


print("N1")
print("nrow(actsByObs")
print(nrow(actsByObs))
print("nrow(tempActsByObs")
print(nrow(tempActsByObs))

actsByObs<-rbind(actsByObs, tempActsByObs)
print("nrow(actsByObs)")
print(nrow(actsByObs))
setActivityNamesByObs(actsByObs)
actsByObs<-data.frame(actsByObs)

print("O")
print("observations length is: ")
print(nrow(observations))
print("subjsByObs length is: ")
print(nrow(subjsByObs))
print(head(subjsByObs))
print("actsByObs length is: ")
print(nrow(actsByObs))
print("actsByObs2:")
print(head(actsByObs))

#Execute the function which alters the variable names and pass it the current names.


clarifyVariableNames(variableNames)
#assign("variableNames",variableNames,.GlobalEnv)
print(head(variableNames))
print("K")

combineObsVarsSubjsActs<-function(observations, variableNames, subjsByObs, actsByObs){
        print("insideCombinObsVarsSubjs variableNames")
        print(variableNames)
        colnames(observations)<-variableNames
        print("Q")
        assign("observations",observations,.GlobalEnv)
        colnames(subjsByObs)[1]<-"subjsByObs"
        print("R")
        subjsByObsIds<-as.character(subjsByObs$subjsByObs)
        assign("subjsByObsIds",subjsByObsIds,.GlobalEnv)
        print("S")
        colnames(actsByObs)[1]<-"actsByObs"
        print("T")
        actsByObs<-as.character(actsByObs$actsByObs)
        assign("actsByObs",actsByObs,.GlobalEnv)
        
}

combineObsVarsSubjsActs(observations, variableNames, subjsByObs, actsByObs)

actsByObs<-data.frame(actsByObs)
subjsByObsIds<-data.frame(subjsByObsIds)

observations<-cbind(actsByObs,observations)
observations<-cbind(subjsByObsIds,observations)
colnames(observations)<-c("subjsIds", "activities", variableNames)

print("W")

#install.packages("doBy")
#require(doBy)
summaryFunction <- function(x) c(means = mean(x)) 
print("X")

#print("observations")
#print(observations)

for (i in 1:length(variableNames)){
        print("Y")
        index<-i+2
        
        if(!file.exists("./tidyMerged")){dir.create("./tidyMerged")}
        
        measureToAggregate<-data.frame(observations[,c(1,2,index)])
        colnames(measureToAggregate)<-c("subjsByObsIds", "actsByObs", "measure")
        measureToAggregate$subjsByObsIds<-as.numeric(as.character(measureToAggregate$subjsByObsIds))
        measureToAggregate <- measureToAggregate[order(measureToAggregate$subjsByObsIds, measureToAggregate$actsByObs) , ]
        write.table(measureToAggregate,paste("./tidyMerged/", variableNames[i],".txt",sep=""),row.names=FALSE)
        
        if(grepl("([M][e][a][n]|[S][t][d][D][e][v])",colnames(observations)[index])==TRUE){
                if(!file.exists("./tidyExtracted")){dir.create("./tidyExtracted")}
                extractionMeanStdDev<-data.frame(observations[,c(1,2,index)])
                colnames(extractionMeanStdDev)<-c("subjsByObsIds", "actsByObs", "measure")
                extractionMeanStdDev$subjsByObsIds<-as.numeric(as.character(extractionMeanStdDev$subjsByObsIds))
                extractionMeanStdDev <- extractionMeanStdDev[order(extractionMeanStdDev$subjsByObsIds, extractionMeanStdDev$actsByObs) , ]
                write.table(extractionMeanStdDev,paste("./tidyExtracted/", variableNames[i],".txt",sep=""),row.names=FALSE)
        }
        
        print("Z")
        if(!file.exists("./tidyAveraged")){dir.create("./tidyAveraged")}
        aggregatedMeasure<-summaryBy(measure ~ subjsByObsIds + actsByObs, data=measureToAggregate, FUN=summaryFunction)
        print("AA")
        colnames(aggregatedMeasure)<-c("subjIds", "activities", "means")
        names(aggregatedMeasure)
        aggregatedMeasure$subjIds<-as.numeric(as.character(aggregatedMeasure$subjIds))
        aggregatedMeasure <- aggregatedMeasure[order(aggregatedMeasure$subjIds, aggregatedMeasure$activities ) , ]
        print("BB")
        
        print("CC")
        write.table(aggregatedMeasure,paste("./tidyAveraged/", variableNames[i],".txt",sep=""),row.names=FALSE)
        print("DD")
        
        
        
}

write.table(variableNames,"tidyVariableNames.txt", sep=" ", quote=FALSE)         
print("EE")

