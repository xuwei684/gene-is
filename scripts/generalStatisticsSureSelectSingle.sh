#General Statistics
output_dir=$1
forward=$2
vectorString=$3
samtools=$4
echo "##################################################################" >  $output_dir/GeneralStatistics.txt
echo "GENERAL STATISTICS" >>  $output_dir/GeneralStatistics.txt
echo "##################################################################" >>  $output_dir/GeneralStatistics.txt
echo " " >>  $output_dir/GeneralStatistics.txt
echo " " >>  $output_dir/GeneralStatistics.txt
echo "Number of raw reads" >>  $output_dir/GeneralStatistics.txt
F=$(zcat $forward | wc -l)
#F=$(sed -n '$=' $forward)
N=4 
DF=$((F/N))
echo $DF >>  $output_dir/GeneralStatistics.txt
echo " " >>  $output_dir/GeneralStatistics.txt
echo "Number of filtered and trimmed reads" >>  $output_dir/GeneralStatistics.txt
#wc -l $output_dir/filtTrim-pair1.fastq >> GeneralStatistics.txt
TF=$(sed -n '$=' $output_dir/filtTrim.fastq)
TN=4
TDF=$((TF/TN))
echo $TDF >> $output_dir/GeneralStatistics.txt
echo " " >> $output_dir/GeneralStatistics.txt
echo "Number of correctly vector aligned reads" >> $output_dir/GeneralStatistics.txt
#echo $vectorString
awk -v vectorString=$vectorString '($3==vectorString)'   $output_dir/completAlignment.sam |  sort -k10,10 -u |  wc -l >> $output_dir/GeneralStatistics.txt
echo " " >> $output_dir/GeneralStatistics.txt
echo "Number of unclustered Integration Sites (sequence_count) " >> $output_dir/GeneralStatistics.txt
cat  $output_dir/ResultsCompleteUnClustered.csv | tail -n +2 |  wc -l >> $output_dir/GeneralStatistics.txt
echo " " >> $output_dir/GeneralStatistics.txt
echo "Number of clustered Integration Sites" >> $output_dir/GeneralStatistics.txt
cat  $output_dir/ResultsClusteredAnnotated.csv |  tail -n +2 | wc -l >> $output_dir/GeneralStatistics.txt
echo " " >> $output_dir/GeneralStatistics.txt

echo " " >> $output_dir/GeneralStatistics.txt
echo "Number of unclustered MULTIPLE HITS/REPEATS Integration Sites (sequence_count) " >> $output_dir/GeneralStatistics.txt
cat  $output_dir/repeats.ResultsCompleteUnClustered.csv | tail -n +2 | wc -l >> $output_dir/GeneralStatistics.txt
echo " " >> $output_dir/GeneralStatistics.txt
echo "Number of clustered  MULTIPLE HITS/REPEATS Integration Sites" >> $output_dir/GeneralStatistics.txt
cat  $output_dir/repeats.ResultsClusteredAnnotated.csv |  tail -n +2 | wc -l >> $output_dir/GeneralStatistics.txt
echo " " >> $output_dir/GeneralStatistics.txt


echo "#################################################################" >> $output_dir/GeneralStatistics.txt
echo " " >> $output_dir/GeneralStatistics.txt
echo " " >> $output_dir/GeneralStatistics.txt
echo "Details of quality filtering and adapter trimming process " >> $output_dir/GeneralStatistics.txt
echo " " >> $output_dir/GeneralStatistics.txt
echo " " >> $output_dir/GeneralStatistics.txt
cat $output_dir/filtTrim.log >> $output_dir/GeneralStatistics.txt
echo " " >> $output_dir/GeneralStatistics.txt
echo " " >> $output_dir/GeneralStatistics.txt
echo "#################################################################" >> $output_dir/GeneralStatistics.txt
echo " " >> $output_dir/GeneralStatistics.txt
echo " " >> $output_dir/GeneralStatistics.txt
echo "Details of basic first alignment" >> $output_dir/GeneralStatistics.txt
echo " " >> $output_dir/GeneralStatistics.txt
echo " " >> $output_dir/GeneralStatistics.txt
$samtools flagstat $output_dir/completAlignment.bam >> $output_dir/GeneralStatistics.txt
echo " " >> $output_dir/GeneralStatistics.txt
echo " " >> $output_dir/GeneralStatistics.txt
echo "#################################################################" >> $output_dir/GeneralStatistics.txt
