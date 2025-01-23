fnTTest <- function(baseGroup, compGroup, testName = "TTest", 
                   baseGroupName, compGroupName, folderName="output-v1") {
    #browser()
    dataMatrixFinal <- cbind(compGroup,baseGroup)
    finalM = {}
    
    for(iCount in 1:nrow(dataMatrixFinal)) {
        #browser()  #use for debugging
        tempMatrix = {}
        #print(iCount)
     
        onerowBaseline <- as.numeric(unlist(baseGroup[iCount,]))
        onerowComparison <- as.numeric(unlist(compGroup[iCount,]))
        featureName = row.names(dataMatrixFinal)[iCount]
        
        tt <- t.test(x = onerowComparison,y = onerowBaseline) #ttest
        
        signedFC = funcCalcSignedFCLog(c = tt$estimate[1], b = tt$estimate[2])
        
        tempM  = cbind(featureName, compGroupName, baseGroupName, 
                       length(onerowComparison),
                       length(onerowBaseline),
                       signedFC,
                       tt$statistic, 
                       tt$parameter, 
                       tt$p.value, 
                       tt$conf.int[1], 
                       tt$conf.int[2],
                       as.character(tt$estimate)[1],
                       as.character(tt$estimate)[2], 
                       tt$null.value, 
                       tt$alternative, 
                       tt$method)
        
        #final matrix that saves the T-Test result from all the individual runs
        finalM = rbind(finalM, tempM) 
        
    } # end of for-loop
    
    ## Q-value calculation
    pval = as.numeric(finalM[,9])
    qval = p.adjust(p = pval, method = "fdr") #Q-value calculation
    
    finalM = cbind(finalM, qval) #append Q-value to the finalMatrix
    
    colnames(finalM) = c("Feature", "CompGroup(C)", "BaseGroup(B)", 
                         "NumSamplesInC", "NumSamplesInB",
                         "SignedFC",
                         "Tstatistic", "Parameter", "Pvalue", 
                         "95%Conf.Int.1", "95%Conf.Int.2", 
                         "MeanC", 
                         "MeanB", 
                         "NullValue-DifferenceInMeans", 
                         "Alternative",
                         "Method", 
                         "FDR")
    
    #Sorting results based on p-value from low to high
    x1 = as.numeric(finalM[,"Pvalue"]) 
    finalMSort = finalM[order(x1),] 
    
    # Create output folder if it doesn/t exist
    if (!dir.exists(folderName)){
        #create new folder 
        dir.create(folderName)
    } else {
        #folder already exists
        #print("Folder already exists!")
    }
    
    #Output file name
    outFileName = paste(testName, compGroupName,"(Comp).vs.",
                        baseGroupName,"(Base).TTest.csv", sep="_" )
    pathName = paste(folderName, "/", outFileName ,sep = "")
    
    #Output file
    write.csv(x = finalMSort, pathName, quote = FALSE, row.names = FALSE)
}

# c and b are log values
funcCalcSignedFCLog <- function(c,b) {
    if (c >= b) {
        fc = 2^(c - b)
    } else {
        fc= -2^(b - c)
    }
    return(fc)
}