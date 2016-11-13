#!/bin/bash
outputDir=$1
sampleName=$2

less  $outputDir/GeneralStatistics.txt > $outputDir/$sampleName.GeneralStatistics.txt
less  $outputDir/ResultsClusteredAnnotated.csv > $outputDir/$sampleName.ResultsClusteredAnnotated.csv
less  $outputDir/ResultsCompleteUnClustered.csv > $outputDir/$sampleName.ResultsCompleteUnClustered.csv
less  $outputDir/ResultsTenStrongestClones.csv  > $outputDir/$sampleName.ResultsTenStrongestClones.csv
less  $outputDir/repeats.ResultsClusteredAnnotated.csv > $outputDir/$sampleName.repeats.ResultsClusteredAnnotated.csv
less  $outputDir/repeats.ResultsCompleteUnClustered.csv > $outputDir/$sampleName.repeats.ResultsCompleteUnClustered.csv

rm $outputDir/completAlignment.sam 
rm $outputDir/GeneralStatistics.txt $outputDir/ResultsClusteredAnnotated.csv    $outputDir/ResultsTenStrongestClones.csv $outputDir/result_AnnotatedIS.csv $outputDir/ResultsCompleteUnClustered.csv  $outputDir/repeats.ResultsCompleteUnClustered.csv $outputDir/repeats.ResultsClusteredAnnotated.csv
rm  $outputDir/resultsNoDup.csv $outputDir/resultsNoDup.csv.total $outputDir/resultsNoDup.csv.total.results $outputDir/resultsNoDupSingle.csv $outputDir/testt1  $outputDir/testt2  $outputDir/testt3 $outputDir/repeats.resultsNoDup.csv $outputDir/repeats.resultsNoDup.csv.total $outputDir/repeats.resultsNoDup.csv.total.results $outputDir/repeats.resultsNoDupSingle.csv
