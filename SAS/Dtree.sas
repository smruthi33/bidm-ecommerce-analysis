*------------------------------------------------------------*;
* EM Version: 14.2;
* SAS Release: 9.04.01M4P110916;
* Host: heinz-f20-119;
* Project Path: C:\Users\shubhamj\Downloads;
* Project Name: test;
* Diagram Id: EMWS2;
* Diagram Name: test2;
* Generated by: shubhamj;
* Date: 18OCT2020:10:49:37;
*------------------------------------------------------------*;
*------------------------------------------------------------*;
* Macro Variables;
*------------------------------------------------------------*;
%let EM_PROJECT =;
%let EM_PROJECTNAME =;
%let EM_WSNAME =;
%let EM_WSDESCRIPTION =test2;
%let EM_SUMMARY =WORK.SUMMARY;
%let EM_NUMTASKS =SINGLE;
%let EM_EDITMODE =R;
%let EM_DEBUGVAL =;
%let EM_ACTION =run;
*------------------------------------------------------------*;
%macro em_usedatatable;
%if ^%symexist(EM_USEDATATABLE) %then %do;
%let EM_USEDATATABLE = Y;
%end;
%if "&EM_USEDATATABLE" ne "N" %then %do;
*------------------------------------------------------------*;
* Data Tables;
*------------------------------------------------------------*;
*------------------------------------------------------------*;
%end;
%mend em_usedatatable;
%em_usedatatable;
*------------------------------------------------------------*;
* Create workspace data set;
*------------------------------------------------------------*;
data workspace;
length property $64 value $200;
property= 'PROJECTLOCATION';
value= "&EM_PROJECT";
output;
property= 'PROJECTNAME';
value= "&EM_PROJECTNAME";
output;
property= 'WORKSPACENAME';
value= "&EM_WSNAME";
output;
property= 'WORKSPACEDESCRIPTION';
value= "&EM_WSDESCRIPTION";
output;
property= 'SUMMARYDATASET';
value= "&EM_SUMMARY";
output;
property= 'NUMTASKS';
value= "&EM_NUMTASKS";
output;
property= 'EDITMODE';
value= "&EM_EDITMODE";
output;
property= 'DEBUG';
value= "&EM_DEBUGVAL";
output;
run;
*------------------------------------------------------------*;
* Create nodes data set;
*------------------------------------------------------------*;
data nodes;
length id $12 component $32 description $64 X 8 Y 8 diagramID $32 parentID $32;
id= "Tree";
component="DecisionTree";
description= "Decision Tree";
diagramID="_ROOT_";
parentID="";
X=576;
Y=218;
output;
id= "Part";
component="Partition";
description= "Data Partition";
diagramID="_ROOT_";
parentID="";
X=378;
Y=264;
output;
id= "FIMPORT";
component="FileImport";
description= "InstaCart Train Data";
diagramID="_ROOT_";
parentID="";
X=204;
Y=281;
output;
id= "EMCODE";
component="SASCode";
description= "SAS Code";
diagramID="_ROOT_";
parentID="";
X=913;
Y=207;
output;
run;
*------------------------------------------------------------*;
* Decmeta Data Set for Tree;
*------------------------------------------------------------*;
data WORK.Tree_reordered_DM;
  length   _TYPE_                           $ 32
           VARIABLE                         $ 32
           LABEL                            $ 256
           LEVEL                            $ 32
           EVENT                            $ 32
           ORDER                            $ 10
           FORMAT                           $ 32
           TYPE                             $ 1
           COST                             $ 32
           USE                              $ 1
           ;

  label    _TYPE_="Type"
           VARIABLE="Variable"
           LABEL="Label"
           LEVEL="Measurement Level"
           EVENT="Target Event"
           ORDER="Order"
           FORMAT="Format"
           TYPE="Type"
           COST="Cost"
           USE="Use"
           ;
_TYPE_="MATRIX";
VARIABLE="";
LABEL="";
LEVEL="PROFIT";
EVENT="";
ORDER="";
FORMAT="";
TYPE="";
COST="";
USE="N";
output;
_TYPE_="TARGET";
VARIABLE="reordered";
LABEL="";
LEVEL="BINARY";
EVENT="1";
ORDER="";
FORMAT="BEST12.0";
TYPE="N";
COST="";
USE="";
output;
_TYPE_="DECISION";
VARIABLE="DECISION1";
LABEL="1";
LEVEL="";
EVENT="";
ORDER="";
FORMAT="";
TYPE="N";
COST="";
USE="Y";
output;
_TYPE_="DECISION";
VARIABLE="DECISION2";
LABEL="0";
LEVEL="";
EVENT="";
ORDER="";
FORMAT="";
TYPE="N";
COST="";
USE="Y";
output;
_TYPE_="DATAPRIOR";
VARIABLE="DATAPRIOR";
LABEL="Data Prior";
LEVEL="";
EVENT="";
ORDER="";
FORMAT="";
TYPE="N";
COST="";
USE="N";
output;
_TYPE_="TRAINPRIOR";
VARIABLE="TRAINPRIOR";
LABEL="Training Prior";
LEVEL="";
EVENT="";
ORDER="";
FORMAT="";
TYPE="N";
COST="";
USE="N";
output;
_TYPE_="DECPRIOR";
VARIABLE="DECPRIOR";
LABEL="Decision Prior";
LEVEL="";
EVENT="";
ORDER="";
FORMAT="";
TYPE="N";
COST="";
USE="N";
output;
_TYPE_="PREDICTED";
VARIABLE="P_reordered1";
LABEL="Predicted: reordered=1";
LEVEL="1";
EVENT="";
ORDER="";
FORMAT="";
TYPE="N";
COST="";
USE="";
output;
_TYPE_="RESIDUAL";
VARIABLE="R_reordered1";
LABEL="Residual: reordered=1";
LEVEL="1";
EVENT="";
ORDER="";
FORMAT="";
TYPE="N";
COST="";
USE="";
output;
_TYPE_="PREDICTED";
VARIABLE="P_reordered0";
LABEL="Predicted: reordered=0";
LEVEL="0";
EVENT="";
ORDER="";
FORMAT="";
TYPE="N";
COST="";
USE="";
output;
_TYPE_="RESIDUAL";
VARIABLE="R_reordered0";
LABEL="Residual: reordered=0";
LEVEL="0";
EVENT="";
ORDER="";
FORMAT="";
TYPE="N";
COST="";
USE="";
output;
_TYPE_="FROM";
VARIABLE="F_reordered";
LABEL="From: reordered";
LEVEL="";
EVENT="";
ORDER="";
FORMAT="";
TYPE="C";
COST="";
USE="";
output;
_TYPE_="INTO";
VARIABLE="I_reordered";
LABEL="Into: reordered";
LEVEL="";
EVENT="";
ORDER="";
FORMAT="";
TYPE="C";
COST="";
USE="";
output;
;
run;
*------------------------------------------------------------*;
* Decdata Data Set for Tree;
*------------------------------------------------------------*;
data WORK.Tree_reordered_DD;
  length   reordered                        $ 32
           COUNT                              8
           DATAPRIOR                          8
           TRAINPRIOR                         8
           DECPRIOR                           8
           DECISION1                          8
           DECISION2                          8
           ;

  label    COUNT="Level Counts"
           DATAPRIOR="Data Proportions"
           TRAINPRIOR="Training Proportions"
           DECPRIOR="Decision Priors"
           DECISION1="1"
           DECISION2="0"
           ;
  format   COUNT 10.
           ;
reordered="1";
COUNT=580177;
DATAPRIOR=0.0978002994;
TRAINPRIOR=0.09780029944732;
DECPRIOR=.;
DECISION1=1;
DECISION2=0;
output;
reordered="0";
COUNT=5352085;
DATAPRIOR=0.9021997006;
TRAINPRIOR=0.90219970055267;
DECPRIOR=.;
DECISION1=0;
DECISION2=1;
output;
;
run;
*------------------------------------------------------------*;
* USERTRAINCODE File for Tree;
*------------------------------------------------------------*;
data _null_;
if symget('sysscp')=:'WIN' then dsep='\';
else if symget('sysscp')=:'DNT' then dsep='\';
else dsep = '/';
filepath = pathname('work')!!dsep!!"Tree_USERTRAINCODE.sas";
call symput('DSPATH', filepath);
run;
data _null_;
filename dspath "&dspath";
file dspath;
run;
*------------------------------------------------------------*;
* EMNOTES File for Tree;
*------------------------------------------------------------*;
data _null_;
if symget('sysscp')=:'WIN' then dsep='\';
else if symget('sysscp')=:'DNT' then dsep='\';
else dsep = '/';
filepath = pathname('work')!!dsep!!"Tree_EMNOTES.txt";
call symput('DSPATH', filepath);
run;
data _null_;
filename dspath "&dspath" encoding="utf-8" NOBOM;
file dspath;
run;
*------------------------------------------------------------*;
* EMNOTES File for Part;
*------------------------------------------------------------*;
data _null_;
if symget('sysscp')=:'WIN' then dsep='\';
else if symget('sysscp')=:'DNT' then dsep='\';
else dsep = '/';
filepath = pathname('work')!!dsep!!"Part_EMNOTES.txt";
call symput('DSPATH', filepath);
run;
data _null_;
filename dspath "&dspath" encoding="utf-8" NOBOM;
file dspath;
run;
*------------------------------------------------------------*;
* Variable Attributes for FIMPORT;
*------------------------------------------------------------*;
data WORK.FIMPORT_VariableAttribute;
length Variable $64 AttributeName $32 AttributeValue $64;
Variable='aisle_id';
AttributeName="ROLE";
AttributeValue='INPUT';
Output;
Variable='department_id';
AttributeName="ROLE";
AttributeValue='INPUT';
Output;
Variable='reordered';
AttributeName="ROLE";
AttributeValue='TARGET';
Output;
Variable='reordered';
AttributeName="LEVEL";
AttributeValue='BINARY';
Output;
run;
*------------------------------------------------------------*;
* USERTRAINCODE File for FIMPORT;
*------------------------------------------------------------*;
data _null_;
if symget('sysscp')=:'WIN' then dsep='\';
else if symget('sysscp')=:'DNT' then dsep='\';
else dsep = '/';
filepath = pathname('work')!!dsep!!"FIMPORT_USERTRAINCODE.sas";
call symput('DSPATH', filepath);
run;
data _null_;
filename dspath "&dspath";
file dspath;
run;
*------------------------------------------------------------*;
* VARIABLESETDELTA File for FIMPORT;
*------------------------------------------------------------*;
data _null_;
if symget('sysscp')=:'WIN' then dsep='\';
else if symget('sysscp')=:'DNT' then dsep='\';
else dsep = '/';
filepath = pathname('work')!!dsep!!"FIMPORT_VARIABLESETDELTA.txt";
call symput('DSPATH', filepath);
run;
data _null_;
filename dspath "&dspath";
file dspath;
put 'if NAME="aisle_id" then do;';
put 'ROLE="INPUT";';
put 'LEVEL="NOMINAL";';
put 'ORDER="";';
put 'DROP="N";';
put 'end;';
put 'if NAME="department_id" then do;';
put 'ROLE="INPUT";';
put 'LEVEL="NOMINAL";';
put 'ORDER="";';
put 'DROP="N";';
put 'end;';
put 'if NAME="reordered" then do;';
put 'ROLE="TARGET";';
put 'LEVEL="BINARY";';
put 'ORDER="";';
put 'DROP="N";';
put 'end;';
run;
*------------------------------------------------------------*;
* DELTACODE File for FIMPORT;
*------------------------------------------------------------*;
data _null_;
if symget('sysscp')=:'WIN' then dsep='\';
else if symget('sysscp')=:'DNT' then dsep='\';
else dsep = '/';
filepath = pathname('work')!!dsep!!"FIMPORT_DELTACODE.txt";
call symput('DSPATH', filepath);
run;
data _null_;
filename dspath "&dspath";
file dspath;
put 'if NAME="aisle_id" then do;';
put 'ROLE="INPUT";';
put 'LEVEL="NOMINAL";';
put 'ORDER="";';
put 'end;';
put 'if NAME="department_id" then do;';
put 'ROLE="INPUT";';
put 'LEVEL="NOMINAL";';
put 'ORDER="";';
put 'end;';
put 'if NAME="reordered" then do;';
put 'ROLE="TARGET";';
put 'LEVEL="BINARY";';
put 'ORDER="";';
put 'end;';
put 'drop DROP;';
run;
*------------------------------------------------------------*;
* EMNOTES File for FIMPORT;
*------------------------------------------------------------*;
data _null_;
if symget('sysscp')=:'WIN' then dsep='\';
else if symget('sysscp')=:'DNT' then dsep='\';
else dsep = '/';
filepath = pathname('work')!!dsep!!"FIMPORT_EMNOTES.txt";
call symput('DSPATH', filepath);
run;
data _null_;
filename dspath "&dspath" encoding="utf-8" NOBOM;
file dspath;
run;
*------------------------------------------------------------*;
* USERTRAINCODE File for EMCODE;
*------------------------------------------------------------*;
data _null_;
if symget('sysscp')=:'WIN' then dsep='\';
else if symget('sysscp')=:'DNT' then dsep='\';
else dsep = '/';
filepath = pathname('work')!!dsep!!"EMCODE_USERTRAINCODE.sas";
call symput('DSPATH', filepath);
run;
data _null_;
filename dspath "&dspath";
file dspath;
run;
*------------------------------------------------------------*;
* EMNOTES File for EMCODE;
*------------------------------------------------------------*;
data _null_;
if symget('sysscp')=:'WIN' then dsep='\';
else if symget('sysscp')=:'DNT' then dsep='\';
else dsep = '/';
filepath = pathname('work')!!dsep!!"EMCODE_EMNOTES.txt";
call symput('DSPATH', filepath);
run;
data _null_;
filename dspath "&dspath" encoding="utf-8" NOBOM;
file dspath;
run;
*------------------------------------------------------------*;
* Create node properties data set;
*------------------------------------------------------------*;
data nodeprops;
length id $12 property $64 value $400;
id= "Tree";
property="Location";
value= "CATALOG";
output;
id= "Tree";
property="Catalog";
value= "SASHELP.EMMODL.TREE.SOURCE";
output;
id= "Tree";
property="ToolType";
value= "MODEL";
output;
id= "Tree";
property="TrainMode";
value= "BATCH";
output;
id= "Tree";
property="ImportModel";
value= "N";
output;
id= "Tree";
property="Freeze";
value= "N";
output;
id= "Tree";
property="UseMultipleTarget";
value= "N";
output;
id= "Tree";
property="Precision";
value= "4";
output;
id= "Tree";
property="IntervalCriterion";
value= "PROBF";
output;
id= "Tree";
property="NominalCriterion";
value= "PROBCHISQ";
output;
id= "Tree";
property="OrdinalCriterion";
value= "ENTROPY";
output;
id= "Tree";
property="SigLevel";
value= "0.2";
output;
id= "Tree";
property="Splitsize";
value= ".";
output;
id= "Tree";
property="LeafSize";
value= "5";
output;
id= "Tree";
property="MinCatSize";
value= "5";
output;
id= "Tree";
property="Maxbranch";
value= "2";
output;
id= "Tree";
property="Maxdepth";
value= "6";
output;
id= "Tree";
property="Nrules";
value= "5";
output;
id= "Tree";
property="Nsurrs";
value= "0";
output;
id= "Tree";
property="MissingValue";
value= "USEINSEARCH";
output;
id= "Tree";
property="UseVarOnce";
value= "N";
output;
id= "Tree";
property="SplitPrecision";
value= "4";
output;
id= "Tree";
property="Subtree";
value= "ASSESSMENT";
output;
id= "Tree";
property="NSubtree";
value= "1";
output;
id= "Tree";
property="AssessMeasure";
value= "ASE";
output;
id= "Tree";
property="AssessPercentage";
value= "0.25";
output;
id= "Tree";
property="NodeSample";
value= "20000";
output;
id= "Tree";
property="Exhaustive";
value= "5000";
output;
id= "Tree";
property="Kass";
value= "Y";
output;
id= "Tree";
property="KassApply";
value= "BEFORE";
output;
id= "Tree";
property="Depth";
value= "Y";
output;
id= "Tree";
property="Inputs";
value= "N";
output;
id= "Tree";
property="NumInputs";
value= "1";
output;
id= "Tree";
property="VarSelection";
value= "N";
output;
id= "Tree";
property="Leafid";
value= "Y";
output;
id= "Tree";
property="NodeRole";
value= "SEGMENT";
output;
id= "Tree";
property="Performance";
value= "DISK";
output;
id= "Tree";
property="CV";
value= "N";
output;
id= "Tree";
property="CVNIter";
value= "10";
output;
id= "Tree";
property="CVRepeat";
value= "1";
output;
id= "Tree";
property="CVSeed";
value= "12345";
output;
id= "Tree";
property="ObsImportance";
value= "N";
output;
id= "Tree";
property="NumSingleImp";
value= "5";
output;
id= "Tree";
property="UseDecision";
value= "N";
output;
id= "Tree";
property="UsePriors";
value= "N";
output;
id= "Tree";
property="ClassColorBy";
value= "PERCENTCORRECT";
output;
id= "Tree";
property="IntColorBy";
value= "AVG";
output;
id= "Tree";
property="ShowNodeId";
value= "Y";
output;
id= "Tree";
property="ShowValid";
value= "Y";
output;
id= "Tree";
property="Pred";
value= "N";
output;
id= "Tree";
property="Target";
value= "ALL";
output;
id= "Tree";
property="Count";
value= "Y";
output;
id= "Tree";
property="ProfitLoss";
value= "NONE";
output;
id= "Tree";
property="PercentCorrect";
value= "N";
output;
id= "Tree";
property="AVG";
value= "Y";
output;
id= "Tree";
property="RASE";
value= "N";
output;
id= "Tree";
property="CreateSample";
value= "USER";
output;
id= "Tree";
property="SampleMethod";
value= "RANDOM";
output;
id= "Tree";
property="SampleSize";
value= "10000000";
output;
id= "Tree";
property="SampleSeed";
value= "12345";
output;
id= "Tree";
property="ForceRun";
value= "N";
output;
id= "Tree";
property="RunAction";
value= "Train";
output;
id= "Tree";
property="Component";
value= "DecisionTree";
output;
id= "Tree";
property="Criterion";
value= "DEFAULT";
output;
id= "Tree";
property="Dummy";
value= "N";
output;
id= "Tree";
property="Predict";
value= "Y";
output;
id= "Tree";
property="ImportedTreeData";
value= "";
output;
id= "Tree";
property="ToolPrefix";
value= "Tree";
output;
id= "Tree";
property="EM_DECMETA_reordered";
value= "WORK.Tree_reordered_DM";
output;
id= "Tree";
property="EM_DECDATA_reordered";
value= "WORK.Tree_reordered_DD";
output;
id= "Tree";
property="EM_FILE_USERTRAINCODE";
value= "Tree_USERTRAINCODE.sas";
output;
id= "Tree";
property="EM_FILE_EMNOTES";
value= "Tree_EMNOTES.txt";
output;
id= "Part";
property="Method";
value= "DEFAULT";
output;
id= "Part";
property="TrainPct";
value= "70";
output;
id= "Part";
property="ValidatePct";
value= "30";
output;
id= "Part";
property="TestPct";
value= "0";
output;
id= "Part";
property="RandomSeed";
value= "12345";
output;
id= "Part";
property="OutputType";
value= "DATA";
output;
id= "Part";
property="IntervalDistribution";
value= "Y";
output;
id= "Part";
property="ClassDistribution";
value= "Y";
output;
id= "Part";
property="ForceRun";
value= "N";
output;
id= "Part";
property="RunAction";
value= "Train";
output;
id= "Part";
property="Component";
value= "Partition";
output;
id= "Part";
property="EM_FILE_EMNOTES";
value= "Part_EMNOTES.txt";
output;
id= "FIMPORT";
property="Location";
value= "CATALOG";
output;
id= "FIMPORT";
property="Catalog";
value= "SASHELP.EMSAMP.FIMPORT.SOURCE";
output;
id= "FIMPORT";
property="ImportType";
value= "Local";
output;
id= "FIMPORT";
property="GuessRows";
value= "500";
output;
id= "FIMPORT";
property="Delimiter";
value= ",";
output;
id= "FIMPORT";
property="NameRow";
value= "Y";
output;
id= "FIMPORT";
property="SkipRows";
value= "0";
output;
id= "FIMPORT";
property="MaxRows";
value= "10000000";
output;
id= "FIMPORT";
property="MaxCols";
value= "10000";
output;
id= "FIMPORT";
property="FileType";
value= "csv";
output;
id= "FIMPORT";
property="Role";
value= "TRAIN";
output;
id= "FIMPORT";
property="ForceRun";
value= "N";
output;
id= "FIMPORT";
property="Summarize";
value= "N";
output;
id= "FIMPORT";
property="AdvancedAdvisor";
value= "N";
output;
id= "FIMPORT";
property="RunAction";
value= "Train";
output;
id= "FIMPORT";
property="Component";
value= "FileImport";
output;
id= "FIMPORT";
property="IFileName";
value= "C:\Users\shubhamj\Downloads\SAS__Train_File.csv";
output;
id= "FIMPORT";
property="AccessTable";
value= "NoTableName";
output;
id= "FIMPORT";
property="UserID";
value= "NoUserID";
output;
id= "FIMPORT";
property="Password";
value= "NoPassword";
output;
id= "FIMPORT";
property="ToolType";
value= "SAMPLE";
output;
id= "FIMPORT";
property="ToolPrefix";
value= "FIMPORT";
output;
id= "FIMPORT";
property="EM_VARIABLEATTRIBUTES";
value= "WORK.FIMPORT_VariableAttribute";
output;
id= "FIMPORT";
property="EM_FILE_USERTRAINCODE";
value= "FIMPORT_USERTRAINCODE.sas";
output;
id= "FIMPORT";
property="EM_FILE_VARIABLESETDELTA";
value= "FIMPORT_VARIABLESETDELTA.txt";
output;
id= "FIMPORT";
property="EM_FILE_DELTACODE";
value= "FIMPORT_DELTACODE.txt";
output;
id= "FIMPORT";
property="EM_FILE_EMNOTES";
value= "FIMPORT_EMNOTES.txt";
output;
id= "EMCODE";
property="UsePriors";
value= "Y";
output;
id= "EMCODE";
property="ToolType";
value= "UTILITY";
output;
id= "EMCODE";
property="DataNeeded";
value= "N";
output;
id= "EMCODE";
property="PublishCode";
value= "PUBLISH";
output;
id= "EMCODE";
property="ScoreCodeFormat";
value= "DATASTEP";
output;
id= "EMCODE";
property="MetaAdvisor";
value= "BASIC";
output;
id= "EMCODE";
property="ForceRun";
value= "N";
output;
id= "EMCODE";
property="RunAction";
value= "Train";
output;
id= "EMCODE";
property="Component";
value= "SASCode";
output;
id= "EMCODE";
property="ToolPrefix";
value= "EMCODE";
output;
id= "EMCODE";
property="EM_FILE_USERTRAINCODE";
value= "EMCODE_USERTRAINCODE.sas";
output;
id= "EMCODE";
property="EM_FILE_EMNOTES";
value= "EMCODE_EMNOTES.txt";
output;
run;
*------------------------------------------------------------*;
* Create connections data set;
*------------------------------------------------------------*;
data connect;
length from to $12;
from="Tree";
to="EMCODE";
output;
from="Part";
to="Tree";
output;
from="FIMPORT";
to="Part";
output;
run;
*------------------------------------------------------------*;
* Create actions to run data set;
*------------------------------------------------------------*;
%macro emaction;
%let actionstring = %upcase(&EM_ACTION);
%if %index(&actionstring, RUN) or %index(&actionstring, REPORT) %then %do;
data actions;
length id $12 action $40;
id="EMCODE";
%if %index(&actionstring, RUN) %then %do;
action='run';
output;
%end;
%if %index(&actionstring, REPORT) %then %do;
action='report';
output;
%end;
run;
%end;
%mend;
%emaction;
*------------------------------------------------------------*;
* Execute the actions;
*------------------------------------------------------------*;
%em5batch(execute, workspace=workspace, nodes=nodes, connect=connect, datasources=datasources, nodeprops=nodeprops, action=actions);
