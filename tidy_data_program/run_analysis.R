###This file run_analysis.R merges the following files 

## features.txt
## activityunderscorelabels
## train/subjectunderscoretrain.txt
## train/yunderscoretrain.txt
## test/subjectunderscoretest.text
## test/yunderscoretest.txt

###and outputs 561 seperate files into the folder tidyMerged. The new files each represent one measurement type, and have all measurements in the data linked directly to participant ID and activity name.

###Each file has three columns: one for indicating subject, one for indicating activity, and one for indicating the variable that is reported. Each file has 10,299 observations.


#install.packages("doBy")
#require("doBy")

#Define a function that renames activities

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
  
}

###

#Define a function that reads data about observations, subjects attached to observations, activities attached to observations,
#activities performed by subjects, and variables (also known as features or measurements) captured or already created.
getData <- function(observationsFile, variablesFile, SubjectsByObjsFile, ActivitiesByObjsFile, activitiesFile){
  
  tempObservations<-read.table(observationsFile,sep="",header=FALSE)
  assign("tempObservations",tempObservations,.GlobalEnv)
  
  variables<-read.table(variablesFile, sep="", header=FALSE)
  
  variableNames<-character(0)
  
  variableNames<-as.character(variables[,2])
  assign("variableNames",variableNames,.GlobalEnv)
  
  tempSubjsByObs<-read.table(SubjectsByObjsFile,sep="", header=FALSE)
  assign("tempSubjsByObs",tempSubjsByObs,.GlobalEnv)
  
  tempActsByObs<-read.table(ActivitiesByObjsFile,sep="", header=FALSE)
  assign("tempActsByObs",tempActsByObs,.GlobalEnv)
  
  activityNames<-read.table(activitiesFile, sep="", header=FALSE)
  assign("activityNames",activityNames,.GlobalEnv)
  
  colnames(activityNames)<-c("Number","Name")
  
}

###

#Define a function that creates variable (i.e., measurement) names that are more readable by a analyst.
clarifyVariableNames <- function (variableNames){
  tempVariableNames<-variableNames
  
  for(i in 1:length(tempVariableNames)){
    
    if(grepl("[b][a][n][d][s][E][n][e][r][g][y]",variableNames[i])){
      
      x<-variableNames[i]
      assign("x",x,.GlobalEnv)
      
      variableNames[i]<-paste(variableNames[i],"A", sep="")
      assign("variableNames",variableNames,.GlobalEnv)
      
      for(j in 1:length(tempVariableNames)){
        
        if(variableNames[j]==x){
          
          y<-variableNames[j]
          
          assign("y",y,.GlobalEnv)
          variableNames[j]<-paste(variableNames[j],"B", sep="")
          
          if(variableNames[j+14]==x){
            variableNames[j+14]<-paste(variableNames[j+14],"C", sep="")     
            
            assign("variableNames",variableNames,.GlobalEnv)
            
            for(k in 1:length(tempVariableNames)){
              
              if(variableNames[k]==variableNames[j]){
                
                z<-variableNames[k]
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
    
    if(!grepl("[b][a][n][d][s][E][n][e][r][g][y]",variableNames[i])){
      if(grepl("[A][c][c]",variableNames[i])){
        
        x<-variableNames[i]
        assign("x",x,.GlobalEnv)
        
        variableNames[i]<-paste(variableNames[i],"A", sep="")
        assign("variableNames",variableNames,.GlobalEnv)
            
        for(j in 1:length(tempVariableNames)){
          
          if(identical(variableNames[j],x)){
                
            y<-variableNames[j]
            
            assign("y",y,.GlobalEnv)
            variableNames[j]<-paste(variableNames[j],"B", sep="")
            assign("variableNames",variableNames,.GlobalEnv)
            
            for(k in 1:length(tempVariableNames)){
              
              if(isTRUE(all.equal(variableNames[k],variableNames[j]))){
                
                z<-variableNames[k]
                
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
    
    if(!grepl("[b][a][n][d][s][E][n][e][r][g][y]",variableNames[i])){
    
      if(grepl("[G][y][r][o]",variableNames[i])){
        
      x<-variableNames[i]
      assign("x",x,.GlobalEnv)
      
      variableNames[i]<-paste(variableNames[i],"A", sep="")
      assign("variableNames",variableNames,.GlobalEnv)
      
      
      for(j in 1:length(tempVariableNames)){
        
        if(identical(variableNames[j],x)){
                    
          y<-variableNames[j]
          
          assign("y",y,.GlobalEnv)
          variableNames[j]<-paste(variableNames[j],"B", sep="")
          assign("variableNames",variableNames,.GlobalEnv)
          
          for(k in 1:length(tempVariableNames)){
            
            if(isTRUE(all.equal(variableNames[k],variableNames[j]))){
              
              z<-variableNames[k]
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
    
    variableNames[i]<-gsub("entropy","Decline", variableNames[i])
    variableNames[i]<-gsub("arCoeff","Coeff", variableNames[i])
    variableNames[i]<-gsub("^f","", variableNames[i])
    variableNames[i]<-gsub("^t","", variableNames[i])
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

assign("tempActsByObs",tempActsByObs,.GlobalEnv)

#Pass the observations, subjects by observation, and acts by observation data from temp to the appropriate data frames.

observations<-tempObservations
subjsByObs<-tempSubjsByObs
actsByObs<-tempActsByObs

getData("test/X_test.txt","features.txt","test/subject_test.txt", "test/y_test.txt", "activity_labels.txt")
observations<-rbind(observations, tempObservations)

subjsByObs<-rbind(subjsByObs, tempSubjsByObs)

actsByObs<-rbind(actsByObs, tempActsByObs)

setActivityNamesByObs(actsByObs)
actsByObs<-data.frame(actsByObs)

#Execute the function which alters the variable names and pass it the current names.

clarifyVariableNames(variableNames)

combineObsVarsSubjsActs<-function(observations, variableNames, subjsByObs, actsByObs){
    
  colnames(observations)<-variableNames
  
  assign("observations",observations,.GlobalEnv)
  colnames(subjsByObs)[1]<-"subjsByObs"
  
  subjsByObsIds<-as.character(subjsByObs$subjsByObs)
  assign("subjsByObsIds",subjsByObsIds,.GlobalEnv)
  
  colnames(actsByObs)[1]<-"actsByObs"
  
  actsByObs<-as.character(actsByObs$actsByObs)
  assign("actsByObs",actsByObs,.GlobalEnv)
  
}

combineObsVarsSubjsActs(observations, variableNames, subjsByObs, actsByObs)

actsByObs<-data.frame(actsByObs)
subjsByObsIds<-data.frame(subjsByObsIds)

observations<-cbind(actsByObs,observations)
observations<-cbind(subjsByObsIds,observations)
colnames(observations)<-c("subjsIds", "activities", variableNames)

summaryFunction <- function(x) c(means = mean(x)) 

for (i in 1:length(variableNames)){
  
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
  
  if(!file.exists("./tidyAveraged")){dir.create("./tidyAveraged")}
  
  aggregatedMeasure<-summaryBy(measure ~ subjsByObsIds + actsByObs, data=measureToAggregate, FUN=summaryFunction)
  
  colnames(aggregatedMeasure)<-c("subjIds", "activities", "means")
  names(aggregatedMeasure)
  aggregatedMeasure$subjIds<-as.numeric(as.character(aggregatedMeasure$subjIds))
  aggregatedMeasure <- aggregatedMeasure[order(aggregatedMeasure$subjIds, aggregatedMeasure$activities ) , ]
  
  write.table(aggregatedMeasure,paste("./tidyAveraged/", variableNames[i],".txt",sep=""),row.names=FALSE)
    
}

write.table(variableNames,"tidyVariableNames.txt", sep=" ", quote=FALSE)         


