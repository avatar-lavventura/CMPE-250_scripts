#!/bin/bash

dueDate="2017-11-23 23:59:59 +0300"
for dir in ./project*;
do (cd "$dir" &&
           alper=$(echo $dir | tail -c +12)  &&
           echo $alper "     " $due &&
           studentDate=$(git ls-files -z | xargs -0 -n1 -I{} -- git log -1 --format="%ai {}" {} | sort | tail -n1 | awk '{print $1" "$2" "$3}') &&
           echo $studentDate "  " $dueDate &&
           (
               if [[ "$studentDate" > "$dueDate" ]]; then
                   echo "LATE*******************************************"
               fi
           )
           echo '-----------------------------'
   );

done

rm project1-*/project1
for dir in ./project*;
do (cd "$dir" && echo "-----------------------------------------------------------------" &&
	   alper=$(echo $dir | tail -c +3) &&
	   echo $alper && cp SurveyClass.cpp LinkedList.cpp ../base &&
           cd ../base &&
           cmake CMakeLists.txt && make > makeOutput.txt && #cat makeOutput.txt && 
           #cp project1       "$dir"           &&
	   cp project1      ../$(echo $alper)              &&
           cp makeOutput.txt $(echo $alper)_makeOutput.txt &&
    	   rm project1                        
           );
done





for dir in ./project*;
do (cd "$dir" &&
	   alper=$(echo $dir | tail -c +3)                                                &&
	   echo $alper                                                                    &&
           (
	   (./project1 ../base/eval_input1.txt output1.txt > /dev/null 2>&1)   &
           (./project1 ../base/eval_input2.txt output2.txt > /dev/null 2>&1)   &
           (./project1 ../base/eval_input3.txt output3.txt > /dev/null 2>&1)   & 
           (./project1 ../base/eval_input4.txt output4.txt > /dev/null 2>&1)
	   ) 
           );
done


for dir in ./project*;
do (cd "$dir" && echo "-----------------------------------------------------------------" &&
	   alper=$(echo $dir | tail -c +3)                                                &&
	   echo $alper                                                                    &&
	   diff -y output1.txt ../base/output1.txt 
           diff -y output2.txt ../base/output2.txt 
           diff -y output3.txt ../base/output3.txt 
           diff -y output4.txt ../base/output4.txt 
	   
   );
done
