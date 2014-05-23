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
        for(i in 1:length(variableNames)){
                
                #transform      
                print("changed variable Name:")
                print(variableNames[i])
                variableNames[i]<-gsub("entropy","Decline", variableNames[i])
                variableNames[i]<-gsub("arCoeff","Coeff", variableNames[i])
                variableNames[i]<-gsub("^f","", variableNames[i])
                variableNames[i]<-gsub("^t","", variableNames[i])
                variableNames[i]<-gsub("Body","", variableNames[i])
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
        print("head(variableNames)")
        print(head(variableNames))
        
        assign("variableNames",variableNames,.GlobalEnv)
        print("J")
        
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
assign("variableNames",variableNames,.GlobalEnv)
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

print("W")

#install.packages("doBy")
#require(doBy)
summaryFunction <- function(x) c(means = mean(x)) 
print("X")

#print("observations")
#print(observations)

for (i in 1:3){
        print("Y")
        index<-i+2
        
        if(!file.exists("./tidyMerged")){dir.create("./tidyMerged")}
        
        measureToAggregate<-data.frame(observations[,c(1,2,index)])
        colnames(measureToAggregate)<-c("subjsByObsIds", "actsByObs", "measure")
        write.table(measureToAggregate,paste("./tidyMerged/", variableNames[i],".txt",sep=""),row.names=FALSE)
        
        print("Z")
        aggregatedMeasure<-summaryBy(measure ~ subjsByObsIds + actsByObs, data=measureToAggregate, FUN=summaryFunction)
        print("AA")
        colnames(aggregatedMeasure)<-c("subjIds", "activities", "means")
        names(aggregatedMeasure)
        aggregatedMeasure <- aggregatedMeasure[order(aggregatedMeasure$subjIds) , ]
        print("BB")
        # print(aggregatedMeasure)
        print("CC")
        write.table(aggregatedMeasure,paste(variableNames[i],".txt",sep=""),row.names=FALSE)
        print("DD")
        
}

write.table(variableNames,"variableNames.txt", sep=" ", quote=FALSE)         
print("EE")

#write.table(actsByObs,"activityNamesByObs", sep=" ", quote=FALSE)    
print("FF")