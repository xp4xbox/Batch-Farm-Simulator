::Farm Town Is An Open Source Batch Farm Simulator Made by Nicolas Hawrysh
::To level up, you must buy 2 pigs, 2 chickens and 10 rows of corn.
@echo off
TITLE Farm Town
color 1f
:start
::change directory to userprofile to load/save save file
cd \ & cd /d %userprofile%
cls
echo Please Type Your Name To Continue :
echo.
echo.
set /p name=
if not defined name (
goto start
)
cls
:check
if exist %name%.sav (
echo Welcome Back %name%!
pause >nul
goto load
) else (
goto sets
)
::default sets
:sets
cls
set cornH=0
set chickenH=0
set pigH=0
set beef=0
set pigfed=0
set chickfed=0
set eggs=0
set milk=0
set cowfed=0
set harvestwheat=0
set harvestbarley=0
set plantwheat=0
set plantbarley=0
set plantcorn=0
set harvestcorn=0
set corn=0
set wheat=0
set barley=0
set energy=20
set level=1
set money=500
set cow=0
set chicken=0
set pig=0
set cowfeed=0
set chickenfeed=0
set pigfeed=0
goto setdefaultvalues

:load
cls
for /f %%a in (%name%.sav) do set %%a
goto setdefaultvalues

:setdefaultvalues
set beefsellprice=12
set eggsellprice=3
set milksellprice=125
set cornsellprice=10
set wheatsellprice=5
set barleysellprice=6

set barleyprice=3
set wheatprice=2
set cornprice=6
set pigprice=65
set chickenprice=37
set cowprice=100
set pigfeedprice=5
set chickenfeedprice=2
set cowfeedprice=7

set feedpercow=15
set feedperchick=2
set feedperpig=10

set dozeneggsperchick=2
set milkbarrelspercow=1
set containersbeefpercow=4
::######################################################################
:main
::check to see if user can level up to level 2
if %level% EQU 1 goto checklevel1up
:back2main
cls
set M=
echo      (Money : $%money%)   (Level : %level%)   (Energy : %energy%)
echo.
echo.
echo.
echo What Would You Like To Do?
echo.
echo.
echo 1) Go To The Store
echo 2) Harvest Field
echo 3) Tend To The Animals
echo 4) Check The Inventory
echo 5) Save Your Game
echo 6) Exit The Game
echo.
echo.
set /p M=
if not defined M (
goto main
)
if "%M%"=="2" goto harvestf
if "%M%"=="1" goto storeM
if "%M%"=="4" goto inventory
if "%M%"=="6" goto exit
if "%M%"=="5" goto save
if "%M%"=="3" goto tanimals
echo.
echo Invalid Choice, Please Try Again!
pause >nul
goto main
::######################################################################
:tanimals
cls
echo      (Money : $%money%)   (Level : %level%)   (Energy : %energy%)
echo.
echo.
echo.
echo Welcome To The Tend To Animals Menu, What Would You Like To Do?
echo.
echo.
echo 1) Feed Animals
echo 2) Collect Milk
echo 3) Collect Eggs
echo 4) Collect Meat
echo 5) Back To Main Menu
echo.
echo.
set /p choice19=
if not defined choice19 (
goto tanimals
)
if "%choice19%"=="1" goto feedA
if "%choice19%"=="2" goto collectM
if "%choice19%"=="3" goto collectEgg
if "%choice19%"=="4" goto collectMeat
if "%choice19%"=="5" goto main
echo.
echo Invalid Choice, Please Try Again.
pause >nul
goto tanimals
::######################################################################
:collectMeat
cls
echo      (Money : $%money%)   (Level : %level%)   (Energy : %energy%)
echo.
echo.
echo.
echo Who Would You Like To Collect Meat From?
echo.
echo.
echo 1) Cow
echo 2) Chicken
echo 3) Pig
echo 4) Back To Tend To Animals
echo.
echo.
set /p choice30=
if not defined choice30 goto collectMeat
if "%choice30%"=="1" goto meatCow
if "%choice30%"=="2" goto meatChicken
if "%choice30%"=="3" goto meatPig
if "%choice30%"=="4" goto tanimals
echo.
echo Invalid Choice, Please Try Again.
pause >nul
goto collectMeat
::######################################################################
:meatCow
cls
echo      (Money : $%money%)   (Level : %level%)   (Energy : %energy%)
echo.
echo.
echo.
if %cow% LSS 1 (
echo You Don't Have Any Cows!
pause >nul
goto tanimals
)
if %cowfed% LSS 1 (
echo Sorry, Your Cows Must Be Fed First.
pause >nul
goto tanimals
)
echo How Many Cows Worth Of Beef Would You Like To Collect? Please Type an Amount.
echo.
echo.
set /p meat2collect=
echo.
echo.
if not defined meat2collect goto meatCow
if %meat2collect% GTR %cowfed% (
echo Sorry, You Do Not Have Enough Fed Cows. You Currently Have %cowfed% Fed Cow{s}.
pause >nul
goto meatCow
)
set /a meat2collectC=%meat2collect% * %containersbeefpercow%
echo Do You Really Want to Butcher %meat2collect% Cow{s} For %meat2collectC% Containers Of Beef? Y/N
echo.
echo.
set /p choice31=
if not defined choice31 goto meatCow
echo.
echo.
if "%choice31%"=="y" goto ycollectBe
if "%choice31%"=="n" goto tanimals
echo Invalid Choice, Please Try Again.
pause >nul
goto meatCow
:ycollectBe
set /a cow=%cow% - %meat2collect%
set /a cowfed=%cowfed% - %meat2collect%
set /a beef=%beef% + %meat2collectC%
cls
echo      (Money : $%money%)   (Level : %level%)   (Energy : %energy%)
echo.
echo.
echo.
echo You Have Collected Your Beef.
pause >nul
goto tanimals
::######################################################################
:collectEgg
cls
echo      (Money : $%money%)   (Level : %level%)   (Energy : %energy%)
echo.
echo.
echo.
if %chicken% LSS 1 (
echo You Don't Have Any Chickens!
pause >nul
goto tanimals
)
if %chickfed% LSS 1 (
echo Sorry, Your Chicken{s} Must Be Fed First.
pause >nul
goto tanimals
)
set /a numofegg=%chickfed% * %dozeneggsperchick%
echo Do You Really Want to Collect %numofegg% Dozen Eggs? Y/N
echo.
echo.
set /p choice27=
if not defined choice27 goto collectEgg
echo.
echo.
if "%choice27%"=="y" goto ycollectEgg
if "%choice27%"=="n" goto tanimals
echo Invalid Choice, Please Try Again.
pause >nul
goto collectEgg
:ycollectEgg
set /a eggs=%eggs% + %numofegg%
set chickfed=0
cls
echo      (Money : $%money%)   (Level : %level%)   (Energy : %energy%)
echo.
echo.
echo.
echo You Have Collected Your Eggs.
pause >nul
goto tanimals
::######################################################################
:collectM
cls
echo      (Money : $%money%)   (Level : %level%)   (Energy : %energy%)
echo.
echo.
echo.
if %cow% LSS 1 (
echo You Don't Have Any Cows!
pause >nul
goto tanimals
)
if %cowfed% LSS 1 (
echo Sorry, Your Cows Must Be Fed First.
pause >nul
goto tanimals
)
set /a barrelsmilk=%cowfed% * %milkbarrelspercow%
echo Do You Really Want to Milk Your Cows For %barrelsmilk% Barrel{s} Of Milk? Y/N
echo.
echo.
set /p choice23=
if not defined choice23 goto collectM
echo.
echo.
if "%choice23%"=="y" goto ycollectM
if "%choice23%"=="n" goto tanimals
echo Invalid Choice, Please Try Again.
pause >nul
goto collectM
:ycollectM
set /a milk=%milk% + %barrelsmilk%
set cowfed=0
cls
echo      (Money : $%money%)   (Level : %level%)   (Energy : %energy%)
echo.
echo.
echo.
echo You Have Collected Your Milk.
pause >nul
goto tanimals
::######################################################################
:feedA
cls
echo      (Money : $%money%)   (Level : %level%)   (Energy : %energy%)
echo.
echo.
echo.
echo Who Would You Like To Feed?
echo.
echo.
echo 1) Cows
echo 2) Chickens
echo 3) Pigs
echo 4) Back To Tend To Animals
echo.
echo.
set /p choice20=
if not defined choice20 (
goto feedA
)
if "%choice20%"=="1" goto feedCow
if "%choice20%"=="2" goto feedChick
if "%choice20%"=="3" goto feedpig
if "%choice20%"=="4" goto tanimals
echo.
echo Invalid Choice, Please Try Again.
pause >nul
goto feedA
::######################################################################
:feedpig
cls
echo      (Money : $%money%)   (Level : %level%)   (Energy : %energy%)
echo.
echo.
echo.
set /a pig2feed=%pig% - %pigfed%
if "%pig2feed%"=="0" (
echo Sorry, You Currently Have No Pigs To Feed.
pause >nul
goto feedA
)
set /a numpigservings=%pig2feed% * %feedperpig%
set /a remaningpigfeed=%numpigservings% - %pigfeed%
if %remaningpigfeed% LSS 1 set "remaningpigfeed="
if %numpigservings% GTR %pigfeed% (
echo Sorry, You Do Not Currently Have Enough Pig Feed To Feed %pig2feed% Pig{s}. Please Purchase %remaningpigfeed% More Servings.
pause >nul
goto feedA
)
echo You Currently Have %pig2feed% Pig{s} That Require Feeding Of %pig% Pig{s}.
echo.
echo.
echo Do You Really Want To Feed %pig2feed% Pig{s} With %numpigservings% Servings? (Y/N)
echo.
echo.
set /p choice29=
if not defined choice29 goto feedpig
echo.
echo.
if "%choice29%"=="y" goto yfeedpig
if "%choice29%"=="n" goto feedA
echo Invalid Choice, Please Try Again.
pause >nul
goto feedpig
:yfeedpig
set /a pigfeed=%pigfeed% - %numpigservings%
set /a pigfed=%pigfed% + %pig2feed%
cls
echo      (Money : $%money%)   (Level : %level%)   (Energy : %energy%)
echo.
echo.
echo.
echo Your Pig{s} Have Been Fed.
pause >nul
goto FeedA
::######################################################################
:feedChick
cls
echo      (Money : $%money%)   (Level : %level%)   (Energy : %energy%)
echo.
echo.
echo.
set /a chick2feed=%chicken% - %chickfed%
if "%chick2feed%"=="0" (
echo Sorry, You Currently Have No Chickens To Feed.
pause >nul
goto feedA
)
::determine # of chickens to feed

set /a numchickservings=%chick2feed% * %feedperchick%
set /a remaningchickfeed=%numchickservings% - %chickenfeed%
if %remaningchickfeed% LSS 1 set "remaningchickfeed="
if %numchickservings% GTR %chickenfeed% (
echo Sorry, You Do Not Currently Have Enough Chicken Feed To Feed %chick2feed% Chickens. Please Purchase %remaningchickfeed% More Servings.
pause >nul
goto feedA
)
echo You Currently Have %chick2feed% Chicken{s} That Require Feeding Of %chicken% Chickens{s}.
echo.
echo.
echo Do You Really Want To Feed %chick2feed% Chicken{s} With %numchickservings% Servings? (Y/N)
echo.
echo.
set /p choice26=
if not defined choice26 goto feedChick
echo.
echo.
if "%choice26%"=="y" goto yfeedchick
if "%choice26%"=="n" goto feedA
echo Invalid Choice, Please Try Again.
pause >nul
goto feedChick
:yfeedchick
set /a chickenfeed=%chickenfeed% - %numchickservings%
set /a chickfed=%chickfed% + %chick2feed%
cls
echo      (Money : $%money%)   (Level : %level%)   (Energy : %energy%)
echo.
echo.
echo.
echo Your Chicken{s} Have Been Fed.
pause >nul
goto FeedA
::######################################################################
:feedCow
cls
echo      (Money : $%money%)   (Level : %level%)   (Energy : %energy%)
echo.
echo.
echo.
set /a cow2feed=%cow% - %cowfed%
if "%cow2feed%"=="0" (
echo Sorry, You Currently Have No Cows To Feed.
pause >nul
goto feedA
)
::determine # of cows to feed

set /a numcowservings=%cow2feed% * %feedpercow%
:: unfortunately this function cannot be set inside the if statement so I need to set the remaining feed outside
set /a remaningcfeed=%numcowservings% - %cowfeed%
if %remaningcfeed% LSS 1 set "remaningcfeed="
::--------------------------------------------------------------
if %numcowservings% GTR %cowfeed% (
echo Sorry, You Do Not Currently Have Enough Cow Feed To Feed %cow2feed% Cows. Please Purchase %remaningcfeed% More Servings.
pause >nul
goto feedA
)
echo You Currently Have %cow2feed% Cow{s} That Require Feeding Of %cow% Cow{s}.
echo.
echo.
echo Do You Really Want To Feed %cow2feed% Cow{s} With %numcowservings% Servings? (Y/N)
echo.
echo.
set /p choice21=
if not defined choice21 (
goto feedCow
)
echo.
echo.
if "%choice21%"=="y" goto yfeedcow
if "%choice21%"=="n" goto feedA
echo Invalid Choice, Please Try Again.
pause >nul
goto feedCow
:yfeedcow
set /a cowfeed=%cowfeed% - %numcowservings%
set /a cowfed=%cowfed% + %cow2feed%
cls
echo      (Money : $%money%)   (Level : %level%)   (Energy : %energy%)
echo.
echo.
echo.
echo Your Cow{s} Have Been Fed.
pause >nul
goto FeedA
::######################################################################
:harvestf
cls
echo      (Money : $%money%)   (Level : %level%)   (Energy : %energy%)
echo.
echo.
echo.
echo Welcome To The Harvest Field, What Would You Like To Do?
echo.
echo.
echo 1) Plant Crops
echo 2) Harvest Crops
echo 3) Check The Field
echo 4) Back To Main Menu
echo.
echo.
set /p HF=
if not defined HF (
goto harvestf
)
if "%HF%"=="1" goto plant
if "%HF%"=="2" goto harvestt
if "%HF%"=="3" goto cfield
if "%HF%"=="4" goto main
echo.
echo Invalid Choice, Please Try Again.
pause >nul
goto harvestf
::####################################################################
:harvestt
cls
echo      (Money : $%money%)   (Level : %level%)   (Energy : %energy%)
echo.
echo.
echo.
echo What Would You Like To Harvest?
echo.
echo.
echo 1) Corn
echo 2) Wheat
echo 3) Barley
echo 4) Back To Harvest Field
echo.
echo.
set /p HV=
if not defined HV (
goto harvestt
)
if "%HV%"=="1" goto harvestcorn
if "%HV%"=="2" goto harvestwheat
if "%HV%"=="3" goto harvestbarley
if "%HV%"=="4" goto harvestf
echo.
echo Invalid Choice, Please Try Again.
pause >nul
goto harvestt
::###################################################################
:harvestwheat
cls
echo      (Money : $%money%)   (Level : %level%)   (Energy : %energy%)
if %plantwheat% LSS 1 (
echo.
echo.
echo.
echo Sorry, You Do Not Have Any Wheat Planted.
pause >nul
goto harvestt
)
echo.
echo.
::Set timer for length until wheat is ready currently at 3 seconds
ping -n 3 127.0.0.1 >nul
echo The Wheat Is Now Ready.
pause >nul
goto harvestwheat2
:harvestwheat2
cls
echo      (Money : $%money%)   (Level : %level%)   (Energy : %energy%)
echo.
echo.
echo.
echo Do You Really Want To Harvest Your Wheat (Y/N)
echo.
echo.
set /p choice15=
if not defined choice15 (
goto harvestwheat2
)
echo.
echo.
if "%choice15%"=="y" goto yharvestwheat
if "%choice15%"=="n" goto harvestt
echo Invalid Choice, Please Try Again.
pause >nul
goto harvestwheat2
:yharvestwheat
set /a harvestwheat=%plantwheat% + %harvestwheat%
set plantwheat=0
cls
echo      (Money : $%money%)   (Level : %level%)   (Energy : %energy%)
echo.
echo.
echo.
echo Your Wheat Has Been Harvested.
pause >nul
goto harvestt
::###################################################################
:harvestbarley
cls
echo      (Money : $%money%)   (Level : %level%)   (Energy : %energy%)
if %plantbarley% LSS 1 (
echo.
echo.
echo.
echo Sorry, You Do Not Have Any Barley Planted.
pause >nul
goto harvestt
)
echo.
echo.
::Set timer for length until barley is ready currently at 3 seconds
ping -n 3 127.0.0.1 >nul
echo The Barley Is Now Ready.
pause >nul
goto harvestbarley2
:harvestbarley2
cls
echo      (Money : $%money%)   (Level : %level%)   (Energy : %energy%)
echo.
echo.
echo.
echo Do You Really Want To Harvest Your Barley (Y/N)
echo.
echo.
set /p choice16=
if not defined choice16 (
goto harvestbarley2
)
echo.
echo.
if "%choice16%"=="y" goto yharvestbarley
if "%choice16%"=="n" goto harvestt
echo Invalid Choice, Please Try Again.
pause >nul
goto harvestbarley2
:yharvestbarley
set /a harvestbarley=%plantbarley% + %harvestbarley%
set plantbarley=0
cls
echo      (Money : $%money%)   (Level : %level%)   (Energy : %energy%)
echo.
echo.
echo.
echo Your Barley Has Been Harvested.
pause >nul
goto harvestt
::###################################################################
:harvestcorn
cls
echo      (Money : $%money%)   (Level : %level%)   (Energy : %energy%)
if %plantcorn% LSS 1 (
echo.
echo.
echo.
echo Sorry, You Do Not Have Any Corn Planted.
pause >nul
goto harvestt
)
echo.
echo.
::Set timer for length until corn is ready currently at 3 seconds
ping -n 3 127.0.0.1 >nul
echo The Corn Is Now Ready.
pause >nul
goto harvestcorn2
:harvestcorn2
cls
echo      (Money : $%money%)   (Level : %level%)   (Energy : %energy%)
echo.
echo.
echo.
echo Do You Really Want To Harvest Your Corn (Y/N)
echo.
echo.
set /p choice14=
if not defined choice14 (
goto harvestcorn2
)
echo.
echo.
if "%choice14%"=="y" goto yharvestcorn
if "%choice14%"=="n" goto harvestt
echo Invalid Choice, Please Try Again.
pause >nul
goto harvestcorn2
:yharvestcorn
set /a harvestcorn=%plantcorn% + %harvestcorn%
set plantcorn=0
cls
echo      (Money : $%money%)   (Level : %level%)   (Energy : %energy%)
echo.
echo.
echo.
echo Your Corn Has Been Harvested.
pause >nul
goto harvestt
::####################################################################
:plant
cls
echo      (Money : $%money%)   (Level : %level%)   (Energy : %energy%)
echo.
echo.
echo.
echo What Would You Like To Plant?
echo.
echo.
echo 1) Corn
echo 2) Wheat
echo 3) Barley
echo 4) Back To Harvest Field
echo.
echo.
set /p PC=
if not defined PC (
goto plant
)
if "%PC%"=="1" goto plantcorn
if "%PC%"=="2" goto plantwheat
if "%PC%"=="3" goto plantbarley
if "%PC%"=="4" goto harvestf
echo.
echo Invalid Choice, Please Try Again.
pause >nul
goto plant
::##################################################################
:plantbarley
cls
echo      (Money : $%money%)   (Level : %level%)   (Energy : %energy%)
echo.
echo.
echo.
echo How Many Row{s} Of Barley Do You Want To Plant? Please Type An Amount
echo.
echo.
set /p plantebarley=Barley To Plant : 
if not defined plantebarley (
goto plantbarley
)
if %plantebarley% GTR %barley% (
echo.
echo.
echo Sorry, You Do Not Have Enough Barley Seeds To Plant That Many Rows.
pause >nul
goto plantbarley
)
echo.
echo.
echo Do You Really Want To Plant %plantebarley% Row{s} Of Barley? (Y/N)
echo.
echo.
set /p choice13=
if not defined choice13 (
goto plantbarley
)
echo.
echo.
if "%choice13%"=="y" goto yplantbarley
if "%choice13%"=="n" goto plantbarley
echo Invalid Choice, Please Try Again.
pause >nul
goto plantbarley
:yplantbarley
set /a plantbarley=%plantbarley% + %plantebarley%
set /a barley=%barley% - %plantebarley%
cls
echo      (Money : $%money%)   (Level : %level%)   (Energy : %energy%)
echo.
echo.
echo.
echo %plantebarley% Row{s} Of Barley Has Been Planted.
pause >nul
goto plant
::####################################################################

:plantwheat
cls
echo      (Money : $%money%)   (Level : %level%)   (Energy : %energy%)
echo.
echo.
echo.
echo How Many Row{s} Of Wheat Do You Want To Plant? Please Type An Amount
echo.
echo.
set /p plantewheat=Wheat To Plant : 
if not defined plantewheat (
goto plantwheat
)
if %plantewheat% GTR %wheat% (
echo.
echo.
echo Sorry, You Do Not Have Enough Wheat Seeds To Plant That Many Rows.
pause >nul
goto plantwheat
)
echo.
echo.
echo Do You Really Want To Plant %plantewheat% Row{s} Of Wheat? (Y/N)
echo.
echo.
set /p choice12=
if not defined choice12 (
goto plantwheat
)
echo.
echo.
if "%choice12%"=="y" goto yplantwheat
if "%choice12%"=="n" goto plantwheat
echo Invalid Choice, Please Try Again.
pause >nul
goto plantwheat
:yplantwheat
set /a wheat=%wheat% - %plantewheat%
set /a plantwheat=%plantwheat% + %plantewheat%
cls
echo      (Money : $%money%)   (Level : %level%)   (Energy : %energy%)
echo.
echo.
echo.
echo %plantewheat% Row{s} Of Wheat Has Been Planted.
pause >nul
goto plant
::####################################################################

:plantcorn
cls
echo      (Money : $%money%)   (Level : %level%)   (Energy : %energy%)
echo.
echo.
echo.
echo How Many Row{s} Of Corn Do You Want To Plant? Please Type An Amount
echo.
echo.
set /p plantecorn=Corn To Plant : 
if not defined plantecorn (
goto plantcorn
)
if %plantecorn% GTR %corn% (
echo.
echo.
echo Sorry, You Do Not Have Enough Corn Seeds To Plant That Many Rows.
pause >nul
goto plantcorn
)
echo.
echo.
echo Do You Really Want To Plant %plantecorn% Row{s} Of Corn? (Y/N)
echo.
echo.
set /p choice11=
if not defined choice11 (
goto plantcorn
)
echo.
echo.
if "%choice11%"=="y" goto yplantcorn
if "%choice11%"=="n" goto plantcorn
echo Invalid Choice, Please Try Again.
pause >nul
goto plantcorn
:yplantcorn
set /a corn=%corn% - %plantecorn%
set /a plantcorn=%plantcorn% + %plantecorn%
cls
echo      (Money : $%money%)   (Level : %level%)   (Energy : %energy%)
echo.
echo.
echo.
echo %plantecorn% Row{s} Of Corn Has Been Planted.
pause >nul
goto plant
::####################################################################
:cfield
cls
echo      (Money : $%money%)   (Level : %level%)   (Energy : %energy%)
echo.
echo.
echo.
echo Here Is A List Of Your Planted Items :
echo.
echo.
if %plantcorn% GTR 0 (
echo Planted Corn : %plantcorn%
echo -----------------------------------------------------
echo.
echo.
)
if %plantwheat% GTR 0 (
echo Planted Wheat : %plantwheat%
echo -----------------------------------------------------
echo.
echo.
)
if %plantbarley% GTR 0 (
echo Planted Barley : %plantbarley%
echo -----------------------------------------------------
echo.
echo.
)
pause >nul
goto harvestf
::####################################################################
:inventory
cls
echo      (Money : $%money%)   (Level : %level%)   (Energy : %energy%)
echo.
echo.
echo.
echo Here Is A List Of Your Current Items :
echo.
echo.
if %cow% GTR 0 (
echo Number Of Cow{s} : %cow%      Cow Feed : %cowfeed%
echo -----------------------------------------------------
echo.
echo.
)
if %chicken% GTR 0 (
echo Number Of Chicken{s} : %chicken%      Chicken Feed : %chickenfeed%	
echo -----------------------------------------------------
echo.
echo.
)
if %pig% GTR 0 (
echo Number Of Pig{s} : %pig%      Pig Feed : %pigfeed%	
echo -----------------------------------------------------
echo.
echo.
)
::-------------------------------------better way to do this?---------------------------------------------
if %cow% LSS 1 (
if %cowfeed% GTR 0 (
echo Number Of Cow{s} : %cow%      Cow Feed : %cowfeed%
echo -----------------------------------------------------
echo.
echo.
))
if %chicken% LSS 1 (
if %chickenfeed% GTR 0 (
echo Number Of Chicken{s} : %chicken%      Chicken Feed : %chickenfeed%	
echo -----------------------------------------------------
echo.
echo.
))
if %pig% LSS 1 (
if %pigfeed% GTR 0 (
echo Number Of pig{s} : %pig%      Pig Feed : %pigfeed%	
echo -----------------------------------------------------
echo.
echo.
))
::-------------------------------------better way to do this?----------------------------------------------
if %corn% GTR 0 (
echo Corn : %corn%
echo -----------------------------------------------------
echo.
echo.
)
if %wheat% GTR 0 (
echo Wheat : %wheat%
echo -----------------------------------------------------
echo.
echo.
)
if %barley% GTR 0 (
echo Barley : %barley%
echo -----------------------------------------------------
echo.
echo.
)
if %harvestcorn% GTR 0 (
echo Harvested Corn : %harvestcorn%
echo -----------------------------------------------------
echo.
echo.
)
if %harvestwheat% GTR 0 (
echo Harvested Wheat : %harvestwheat%
echo -----------------------------------------------------
echo.
echo.
)
if %harvestbarley% GTR 0 (
echo Harvested Barley : %harvestbarley%
echo -----------------------------------------------------
echo.
echo.
)
if %milk% GTR 0 (
echo Barrel{s} Of Milk : %milk%
echo -----------------------------------------------------
echo.
echo.
)
if %eggs% GTR 0 (
echo Dozen Eggs : %eggs%
echo -----------------------------------------------------
echo.
echo.
)
if %beef% GTR 0 (
echo Containers Of Beef : %beef%
echo -----------------------------------------------------
echo.
echo.
)
pause >nul
goto main
::######################################################################
:storeM
cls
echo      (Money : $%money%)   (Level : %level%)   (Energy : %energy%)
echo.
echo.
echo.
echo Welcome To The Store, What Would You Like To Do?
echo.
echo.
echo 1) Buy
echo 2) Sell
echo 3) Back To Main Menu
echo.
echo.
set /p StoreMC=
if not defined StoreMC (
goto storeM
)
if "%StoreMC%"=="1" goto store
if "%StoreMC%"=="2" goto sell
if "%StoreMC%"=="3" goto main
echo.
echo Invalid Choice, Please Try Again!
pause >nul
goto storeM
::######################################################################
:sell
cls
echo      (Money : $%money%)   (Level : %level%)   (Energy : %energy%)
echo.
echo.
echo.
echo Welcome To The Store, What Would You Like To Sell?
echo.
echo.
echo 1) Crops
echo 2) Milk
echo 3) Eggs
echo 4) Meat
echo 5) Back To Main Menu
echo.
echo.
set /p sellC=
if not defined SellC (
goto sell
)
if "%sellC%"=="1" goto cropsS
if "%sellC%"=="2" goto sellM
if "%sellC%"=="3" goto sellE
if "%sellC%"=="4" goto sellMeat
if "%sellC%"=="5" goto main
echo.
echo Invalid Choice, Please Try Again.
pause >nul
goto sell
::######################################################################
:sellMeat
cls
echo      (Money : $%money%)   (Level : %level%)   (Energy : %energy%)
echo.
echo.
echo.
echo What Type Of Meat Would You Like To Sell?
echo.
echo.
echo 1) Beef
echo 2) Ham
echo 3) Chicken
echo 4) Back To The Store
echo.
echo.
set /p sellMeatC=
if not defined sellMeatC goto sellMeat
if "%sellMeatC%"=="1" goto sellBeef
if "%sellMeatC%"=="2" goto sellHam
if "%sellMeatC%"=="3" goto sellChickenMeat
if "%sellMeatC%"=="4" goto sell
echo.
echo Invalid Choice, Please Try Again.
pause >nul
goto sellMeat
::######################################################################
:sellBeef
cls
echo      (Money : $%money%)   (Level : %level%)   (Energy : %energy%)
echo.
echo.
echo.
if %beef% LSS 1 (
echo Sorry, You Currently Have No Beef To Sell.
pause >nul
goto sellMeat
)
echo A Container Of Beef Is Currently Worth $%beefsellprice%.
echo.
echo.
echo How Many Containers Would You Like To Sell? Please Type An Amount.
echo.
echo.
set /p sellbeef=Beef To Sell: 
if not defined sellbeef goto sellBeef
if %sellbeef% GTR %beef% (
echo.
echo.
echo You Do Not Have Enough Beef To Sell %sellbeef% Containers. You Currently Have %beef% Containers.
pause >nul
goto sellBeef
)
echo.
echo.
set /a beefincome=%beefsellprice% * %sellbeef%
echo Do You Really Want To Sell %sellbeef% Containers For $%beefincome%? Y/N
echo.
echo.
set /p choice32=
if not defined choice32 goto sellBeef
echo.
echo.
if "%choice32%"=="y" goto ysellbeef
if "%choice32%"=="n" goto sellBeef
echo Invalid Choice, Please Try Again.
pause >nul
goto sellBeef
:ysellbeef
set /a beef=%beef% - %sellbeef%
set /a money=%money% + %beefincome%
cls
echo      (Money : $%money%)   (Level : %level%)   (Energy : %energy%)
echo.
echo.
echo.
echo You Have Sold Your Beef.
pause >nul
goto sellMeat
::######################################################################
:sellE
cls
echo      (Money : $%money%)   (Level : %level%)   (Energy : %energy%)
echo.
echo.
echo.
if %eggs% LSS 1 (
echo Sorry, You Currently Have No Eggs To Sell.
pause >nul
goto sell
)
echo A Dozen Eggs Is Currently Worth $%eggsellprice%.
echo.
echo.
echo How Many Dozen Eggs Would You Like To Sell? Please Type An Amount.
echo.
echo.
set /p sellegg=Eggs To Sell: 
if not defined sellegg goto sellE
if %sellegg% GTR %eggs% (
echo.
echo.
echo You Do Not Have Enough Eggs To Sell %selleggs% Dozen. You Currently Have %eggs% Dozen.
pause >nul
goto sellE
)
echo.
echo.
set /a eggincome=%eggsellprice% * %sellegg%
echo Do You Really Want To Sell %sellegg% Dozen Eggs For $%eggincome%? Y/N
echo.
echo.
set /p choice28=
if not defined choice28 goto sellE
echo.
echo.
if "%choice28%"=="y" goto yselleggs
if "%choice28%"=="n" goto sell
echo Invalid Choice, Please Try Again.
pause >nul
goto sellE
:yselleggs
set /a eggs=%eggs% - %sellegg%
set /a money=%money% + %eggincome%
cls
echo      (Money : $%money%)   (Level : %level%)   (Energy : %energy%)
echo.
echo.
echo.
echo You Have Sold Your Eggs.
pause >nul
goto sell
::######################################################################
:sellM
cls
echo      (Money : $%money%)   (Level : %level%)   (Energy : %energy%)
echo.
echo.
echo.
if %milk% LSS 1 (
echo Sorry, You Currently Have No Milk To Sell.
pause >nul
goto sell
)
echo Milk Is Currently Worth $%milksellprice% Per Barrel.
echo.
echo.
echo How Much Milk Would You Like To Sell? Please Type An Amount.
echo.
echo.
set /p sellmilk=Milk To Sell: 
if not defined sellmilk (
goto sellM
)
if %sellmilk% GTR %milk% (
echo.
echo.
echo You Do Not Have Enough Milk To Sell %sellmilk% Barrels{s}. You Currently Have %milk% Barrels{s}.
pause >nul
goto sellM
)
echo.
echo.
set /a milkincome=%milksellprice% * %sellmilk%
echo Do You Really Want To Sell %sellmilk% Barrel{s} Milk For $%milkincome%? Y/N
echo.
echo.
set /p choice25=
if not defined choice25 goto sellM
echo.
echo.
if "%choice25%"=="y" goto ysellmilk
if "%choice25%"=="n" goto sell
echo Invalid Choice, Please Try Again.
pause >nul
goto sellM
:ysellmilk
set /a milk=%milk% - %sellmilk%
set /a money=%money% + %milkincome%
cls
echo      (Money : $%money%)   (Level : %level%)   (Energy : %energy%)
echo.
echo.
echo.
echo You Have Sold Your Milk.
pause >nul
goto sell
::######################################################################
:cropsS
cls
echo      (Money : $%money%)   (Level : %level%)   (Energy : %energy%)
echo.
echo.
echo.
echo Which Crops Would You Like To Sell?
echo.
echo.
echo 1) Corn
echo 2) Wheat
echo 3) Barley
echo 4) Back To Store
echo.
echo.
set /p cropsC=
if not defined cropsC (
goto cropsS
)
if "%cropsC%"=="1" goto sellcorn
if "%cropsC%"=="2" goto sellwheat
if "%cropsC%"=="3" goto sellbarley
if "%cropsC%"=="4" goto sell
echo.
echo Invalid Choice. Please Try Again.
pause >nul
goto cropsS
::######################################################################
:sellcorn
cls
echo      (Money : $%money%)   (Level : %level%)   (Energy : %energy%)
echo.
echo.
echo.
echo Corn Is Currently Worth $%cornsellprice% Per Bushel {Row}.
echo.
echo.
echo How Much Corn Would You Like To Sell? Please Type An Amount.
echo.
echo.
set /p sellcorn=Corn To Sell: 
if not defined sellcorn (
goto sellcorn
)
if %sellcorn% GTR %harvestcorn% (
echo.
echo.
echo You Do Not Have Enough Corn To Sell %sellcorn% Bushel{s}. You Currently Have %harvestcorn% Bushels{s}.
pause >nul
goto sellcorn
)
set /a cornsellmoney=%sellcorn% * %cornsellprice%
echo.
echo.
echo Do You Really Want To Sell %sellcorn% Bushel{s} Of Corn For $%cornsellmoney%? (Y/N)
echo.
echo.
set /p choice17=
if not defined choice17 (
goto sellcorn
)
echo.
echo.
if "%choice17%"=="y" goto ysellcorn
if "%choice17%"=="n" set cornsellmoney=0 & goto cropsS
echo Invalid Choice, Please Try Again.
pause >nul
goto sellcorn
:ysellcorn
set /a harvestcorn=%harvestcorn% - %sellcorn%
set /a money=%money% + %cornsellmoney%
cls
echo      (Money : $%money%)   (Level : %level%)   (Energy : %energy%)
echo.
echo.
echo.
echo %sellcorn% Bushel{s} Of Corn Have Been Sold.
pause >nul
goto cropsS
::######################################################################
:sellwheat
cls
echo      (Money : $%money%)   (Level : %level%)   (Energy : %energy%)
echo.
echo.
echo.
echo Wheat Is Currently Worth $%wheatsellpric% Per Bushel {Row}.
echo.
echo.
echo How Much Wheat Would You Like To Sell? Please Type An Amount.
echo.
echo.
set /p sellwheat=Wheat To Sell: 
if not defined sellwheat (
goto sellwheat
)
if %sellwheat% GTR %harvestwheat% (
echo.
echo.
echo You Do Not Have Enough Wheat To Sell %sellwheat% Bushel{s}. You Currently Have %harvestwheat% Bushels{s}.
pause >nul
goto sellwheat
)
set /a wheatsellmoney=%sellwheat% * %wheatsellprice%
echo.
echo.
echo Do You Really Want To Sell %sellwheat% Bushel{s} Of Wheat For $%wheatsellmoney%? (Y/N)
echo.
echo.
set /p choice18=
if not defined choice18 (
goto sellwheat
)
echo.
echo.
if "%choice18%"=="y" goto ysellwheat
if "%choice18%"=="n" set wheatsellmoney=0 & goto cropsS
echo Invalid Choice, Please Try Again.
pause >nul
goto sellwheat
:ysellwheat
set /a harvestwheat=%harvestwheat% - %sellwheat%
set /a money=%money% + %wheatsellmoney%
cls
echo      (Money : $%money%)   (Level : %level%)   (Energy : %energy%)
echo.
echo.
echo.
echo %sellwheat% Bushel{s} Of Wheat Have Been Sold.
pause >nul
goto cropsS
::######################################################################
:sellbarley
cls
echo      (Money : $%money%)   (Level : %level%)   (Energy : %energy%)
echo.
echo.
echo.
echo Barley Is Currently Worth $%barleysellprice% Per Bushel {Row}.
echo.
echo.
echo How Much Barley Would You Like To Sell? Please Type An Amount.
echo.
echo.
set /p sellbarley=Barley To Sell: 
if not defined sellbarley (
goto sellbarley
)
if %sellbarley% GTR %harvestbarley% (
echo.
echo.
echo You Do Not Have Enough Barley To Sell %sellbarley% Bushel{s}. You Currently Have %harvestbarley% Bushels{s}.
pause >nul
goto sellbarley
)
set /a barleysellmoney=%sellbarley% * %barleysellprice%
echo.
echo.
echo Do You Really Want To Sell %sellbarley% Bushel{s} Of Barley For $%barleysellmoney%? (Y/N)
echo.
echo.
set /p choice18=
if not defined choice18 (
goto sellbarley
)
echo.
echo.
if "%choice18%"=="y" goto ysellbarley
if "%choice18%"=="n" set barleysellmoney=0 & goto cropsS
echo Invalid Choice, Please Try Again.
pause >nul
goto sellbarley
:ysellbarley
set /a harvestbarley=%harvestbarley% - %sellbarley%
set /a money=%money% + %barleysellmoney%
cls
echo      (Money : $%money%)   (Level : %level%)   (Energy : %energy%)
echo.
echo.
echo.
echo %sellbarley% Bushel{s} Of Barley Have Been Sold.
pause >nul
goto cropsS
::######################################################################
:store
cls
echo      (Money : $%money%)   (Level : %level%)   (Energy : %energy%)
echo.
echo.
echo.
echo Welcome To The Store, What Would You Like To Buy?
echo.
echo.
echo 1) Crops
echo 2) Animals
echo 3) Feed
echo 4) Back To Main Menu
echo.
echo.
set /p S=
if not defined S (
goto store
)
if "%S%"=="1" goto crops
if "%S%"=="3" goto animalfeed
if "%S%"=="2" goto animal
if "%S%"=="4" goto main
echo.
echo Invalid Choice, Please Try Again!
pause >nul
goto store
::######################################################################
:crops
cls
echo      (Money : $%money%)   (Level : %level%)   (Energy : %energy%)
echo.
echo.
echo.
echo What Crops Would You Like To Buy?
echo.
echo.
echo 1) Corn
echo 2) Wheat
echo 3) Barley
echo 4) Back To Store
echo.
echo.
set /p S3=
if not defined S3 (
goto crops
)
if "%S3%"=="1" goto buycorn
if "%S3%"=="2" goto buywheat
if "%S3%"=="3" goto buybarley
if "%S3%"=="4" goto store
echo.
echo Invalid Choice. Please Try Again.
pause >nul
goto crops
::####################################################################
:buybarley
cls
echo      (Money : $%money%)   (Level : %level%)   (Energy : %energy%)
echo.
echo.
echo.
echo Barley Seed Is Currently $%barleyprice% Per Row.
echo.
echo.
echo How Many Barley Seeds Would You Like To Buy? Please Type An Amount.
echo.
echo.
set /p buybarley=Barley Seeds To Buy: 
if not defined buybarley (
goto buybarley
)
set /a barleytotal=%buybarley% * %barleyprice%
if %barleytotal% GTR %money% (
echo.
echo.
echo Sorry, You Do Not Have Enough Money To Purchase That Many Barley Seeds.
pause >nul
goto buybarley
)
echo.
echo.
echo Do You Really Want To Buy %buybarley% Row{s} Of Barley Seed For $%barleytotal%? (Y/N)
echo.
echo.
set /p choice10=
if not defined choice10 (
goto buybarley
)
echo.
echo.
if "%choice10%"=="y" goto ybuybarley
if "%choice10%"=="n" goto buybarley
echo Invalid Choice, Please Try Again.
pause >nul
goto buybarley
:ybuybarley
set /a barley=%buybarley% + %barley%
set /a money=%money% - %barleytotal%
cls
echo      (Money : $%money%)   (Level : %level%)   (Energy : %energy%)
echo.
echo.
echo.
echo %buybarley% Row{s} Of Barley Seed Have Been Purchased.
pause >nul
goto crops
::######################################################################
:buywheat
cls
echo      (Money : $%money%)   (Level : %level%)   (Energy : %energy%)
echo.
echo.
echo.
echo Wheat Seed Is Currently $%wheatprice% Per Row.
echo.
echo.
echo How Many Wheat Seeds Would You Like To Buy? Please Type An Amount.
echo.
echo.
set /p buywheat=Wheat Seeds To Buy: 
if not defined buywheat (
goto buywheat
)
set /a wheattotal=%buywheat% * %wheatprice%
if %wheattotal% GTR %money% (
echo.
echo.
echo Sorry, You Do Not Have Enough Money To Purchase That Many Wheat Seeds.
pause >nul
goto buywheat
)
echo.
echo.
echo Do You Really Want To Buy %buywheat% Row{s} Of Wheat Seed For $%wheattotal%? (Y/N)
echo.
echo.
set /p choice9=
if not defined choice9 (
goto buywheat
)
echo.
echo.
if "%choice9%"=="y" goto ybuywheat
if "%choice9%"=="n" goto buywheat
echo Invalid Choice, Please Try Again.
pause >nul
goto buywheat
:ybuywheat
set /a wheat=%buywheat% + %wheat%
set /a money=%money% - %wheattotal%
cls
echo      (Money : $%money%)   (Level : %level%)   (Energy : %energy%)
echo.
echo.
echo.
echo %buywheat% Row{s} Of Wheat Seed Have Been Purchased.
pause >nul
goto crops
::######################################################################
:buycorn
cls
echo      (Money : $%money%)   (Level : %level%)   (Energy : %energy%)
echo.
echo.
echo.
echo Corn Seed Is Currently $%cornprice% Per Row.
echo.
echo.
echo How Many Corn Seeds Would You Like To Buy? Please Type An Amount.
echo.
echo.
set /p buycorn=Corn Seeds To Buy: 
if not defined buycorn (
goto buycorn
)
set /a corntotal=%buycorn% * %cornprice%
if %corntotal% GTR %money% (
echo.
echo.
echo Sorry, You Do Not Have Enough Money To Purchase That Many Corn Seeds.
pause >nul
goto buycorn
)
echo.
echo.
echo Do You Really Want To Buy %buycorn% Row{s} Of Corn Seed For $%corntotal%? (Y/N)
echo.
echo.
set /p choice8=
if not defined choice8 (
goto buycorn
)
echo.
echo.
if "%choice8%"=="y" goto ybuycorn
if "%choice8%"=="n" goto buycorn
echo Invalid Choice, Please Try Again.
pause >nul
goto buycorn
:ybuycorn
set /a corn=%buycorn% + %corn%
set /a money=%money% - %corntotal%
:: log to corn buy history
set /a cornH=%cornH% + %buycorn%
cls
echo      (Money : $%money%)   (Level : %level%)   (Energy : %energy%)
echo.
echo.
echo.
echo %buycorn% Row{s} Of Corn Seed Have Been Purchased.
pause >nul
goto crops
::######################################################################
:animal
cls
echo      (Money : $%money%)   (Level : %level%)   (Energy : %energy%)
echo.
echo.
echo.
echo What Animal{s} Would You Like To Buy?
echo.
echo.
echo 1) Cow
echo 2) Chicken
echo 3) Pig
echo 4) Back To Store
echo.
echo.
set /p S1=
if not defined S1 (
goto animal
)
if "%S1%"=="3" goto buypig
if "%S1%"=="2" goto buychicken
if "%S1%"=="1" goto buycow
if "%S1%"=="4" goto store
echo.
echo Invalid Choice, Please Try Again.
pause >nul
goto animal
::######################################################################
:buypig
cls
echo      (Money : $%money%)   (Level : %level%)   (Energy : %energy%)
echo.
echo.
echo.
echo Pigs Are Currently $%pigprice% Each.
echo.
echo.
echo How Many Pig{s} Would You Like To Buy? Please Type An Amount.
echo.
echo.
set /p buypig=Pig{s} To Buy: 
if not defined buypig (
goto buypig
)
set /a pigtotal=%buypig% * %pigprice%
if %pigtotal% GTR %money% (
echo.
echo.
echo Sorry, You Do Not Have Enough Money To Purchase That Many Pig{s}.
pause >nul
goto buypig
)
echo.
echo.
echo Do You Really Want To Buy %buypig% Pig{s} For $%pigtotal%? (Y/N)
echo.
echo.
set /p choice6=
if not defined choice6 (
goto buypig
)
echo.
echo.
if "%choice6%"=="y" goto ybuypig
if "%choice6%"=="n" goto buypig
echo Invalid Choice, Please Try Again.
pause >nul
goto buypig
:ybuypig
set /a pig=%buypig% + %pig%
set /a money=%money% - %pigtotal%
::add to total pig buy history
set /a pigH=%pigH% + %buypig%
cls
echo      (Money : $%money%)   (Level : %level%)   (Energy : %energy%)
echo.
echo.
echo.
echo %buypig% Pig{s} Have Been Purchased.
pause >nul
goto animal
::######################################################################
:buychicken
cls
echo      (Money : $%money%)   (Level : %level%)   (Energy : %energy%)
echo.
echo.
echo.
echo Chickens Are Currently $%chickenprice% Each.
echo.
echo.
echo How Many Chicken{s} Would You Like To Buy? Please Type An Amount.
echo.
echo.
set /p buychicken=Chicken{s} To Buy: 
if not defined buychicken (
goto buychicken
)
set /a chickentotal=%buychicken% * %chickenprice%
if %chickentotal% GTR %money% (
echo.
echo.
echo Sorry, You Do Not Have Enough Money To Purchase That Many Chicken{s}.
pause >nul
goto buychicken
)
echo.
echo.
echo Do You Really Want To Buy %buychicken% Chicken{s} For $%chickentotal%? (Y/N)
echo.
echo.
set /p choice2=
if not defined choice2 (
goto buychicken
)
echo.
echo.
if "%choice2%"=="y" goto ybuychicken
if "%choice2%"=="n" goto buychicken
echo Invalid Choice, Please Try Again.
pause >nul
goto buychicken
:ybuychicken
set /a chicken=%buychicken% + %chicken%
set /a money=%money% - %chickentotal%
::add to total chicken buy history
set /a chickenH=%chickenH% + %buychicken%
cls
echo      (Money : $%money%)   (Level : %level%)   (Energy : %energy%)
echo.
echo.
echo.
echo %buychicken% Chicken{s} Have Been Purchased.
pause >nul
goto animal
::######################################################################
:buycow
cls
echo      (Money : $%money%)   (Level : %level%)   (Energy : %energy%)
echo.
echo.
echo.
if %level% LSS 2 (
echo Sorry, You Must Be At Least Level 2 To Buy A Cow.
pause >nul
goto main
)
echo Cows Are Currently $%cowprice% Each
echo.
echo.
echo How Many Cow{s} Would You Like To Buy? Please Type An Amount.
echo.
echo.
set /p buycow=Cow{s} To Buy: 
if not defined buycow (
goto buycow
)
set /a cowtotal=%buycow% * %cowprice%
if %cowtotal% GTR %money% (
echo.
echo.
echo Sorry, You Do Not Have Enough Money To Purchase That Many Cow{s}.
pause >nul
goto buycow
)
echo.
echo.
echo Do You Really Want To Buy %buycow% Cow{s} For $%cowtotal%? (Y/N)
echo.
echo.
set /p choice1=
if not defined choice1 (
goto buycow
)
echo.
echo.
if "%choice1%"=="y" goto ybuycow
if "%choice1%"=="n" goto buycow
echo Invalid Choice, Please Try Again!
pause >nul
goto buycow
:ybuycow
set /a cow=%buycow% + %cow%
set /a money=%money% - %cowtotal%
cls
echo      (Money : $%money%)   (Level : %level%)   (Energy : %energy%)
echo.
echo.
echo.
echo %buycow% Cow{s} Have Been Purchased.
pause >nul
goto animal
::######################################################################
:animalfeed
cls
echo      (Money : $%money%)   (Level : %level%)   (Energy : %energy%)
echo.
echo.
echo.
echo What Feed Would You Like To Buy?
echo.
echo.
echo 1) Cow Feed
echo 2) Chicken Feed
echo 3) Pig Feed
echo 4) Back To Store
echo.
echo.
set /p tanimalfeed=
if not defined tanimalfeed (
goto animalfeed
)
if "%tanimalfeed%"=="3" goto buypigfeed
if "%tanimalfeed%"=="2" goto buychickenfeed
if "%tanimalfeed%"=="1" goto buycowfeed
if "%tanimalfeed%"=="4" goto store
echo.
echo Invalid Choice, Please Try Again.
pause >nul
goto animalfeed
::######################################################################
:buypigfeed
cls
echo      (Money : $%money%)   (Level : %level%)   (Energy : %energy%)
echo.
echo.
echo.
echo Pig Feed Is Currently $%pigfeedprice% Per Serving.
echo.
echo.
echo How Much Pig Feed Would You Like To Buy? Please Type An Amount.
echo.
echo.
set /p buypigfeed=Pig Feed To Buy: 
if not defined buypigfeed (
goto buypigfeed
)
set /a pigfeedtotal=%buypigfeed% * %pigfeedprice%
if %pigfeedtotal% GTR %money% (
echo.
echo.
echo Sorry, You Do Not Have Enough Money To Purchase That Much Pig Feed.
pause >nul
goto buypigfeed
)
echo.
echo.
echo Do You Really Want To Buy %buypigfeed% Serving{s} Of Pig Feed For $%pigfeedtotal%? (Y/N)
echo.
echo.
set /p choice7=
if not defined choice7 (
goto buypigfeed
)
echo.
echo.
if "%choice7%"=="y" goto ybuypigfeed
if "%choice7%"=="n" goto buypigfeed
echo Invalid Choice, Please Try Again!
pause >nul
goto buypigfeed
:ybuypigfeed
set /a pigfeed=%buypigfeed% + %pigfeed%
set /a money=%money% - %pigfeedtotal%
cls
echo      (Money : $%money%)   (Level : %level%)   (Energy : %energy%)
echo.
echo.
echo.
echo %buypigfeed% Serving{s} Of Pig Feed Have Been Purchased.
pause >nul
goto animalfeed
::######################################################################
:buychickenfeed
cls
echo      (Money : $%money%)   (Level : %level%)   (Energy : %energy%)
echo.
echo.
echo.
echo Chicken Feed Is Currently $%chickenfeedprice% Per Serving.
echo.
echo.
echo How Much Chicken Feed Would You Like To Buy? Please Type An Amount.
echo.
echo.
set /p buychickenfeed=Chicken Feed To Buy: 
if not defined buychickenfeed (
goto buychickenfeed
)
set /a chickenfeedtotal=%buychickenfeed% * %chickenfeedprice%
if %chickenfeedtotal% GTR %money% (
echo.
echo.
echo Sorry, You Do Not Have Enough Money To Purchase That Much Chicken Feed.
pause >nul
goto buychickenfeed
)
echo.
echo.
echo Do You Really Want To Buy %buychickenfeed% Serving{s} Of Chicken Feed For $%chickenfeedtotal%? (Y/N)
echo.
echo.
set /p choice4=
if not defined choice4 (
goto buychickenfeed
)
echo.
echo.
if "%choice4%"=="y" goto ybuychickenfeed
if "%choice4%"=="n" goto buychickenfeed
echo Invalid Choice, Please Try Again!
pause >nul
goto buychickenfeed
:ybuychickenfeed
set /a chickenfeed=%buychickenfeed% + %chickenfeed%
set /a money=%money% - %chickenfeedtotal%
cls
echo      (Money : $%money%)   (Level : %level%)   (Energy : %energy%)
echo.
echo.
echo.
echo %buychickenfeed% Serving{s} Of Chicken Feed Have Been Purchased.
pause >nul
goto animalfeed
::######################################################################
:buycowfeed
cls
echo      (Money : $%money%)   (Level : %level%)   (Energy : %energy%)
echo.
echo.
echo.
echo Cow Feed Is Currently $%cowfeedprice% Per Serving.
echo.
echo.
echo How Much Cow Feed Would You Like To Buy? Please Type An Amount.
echo.
echo.
set /p buycowfeed=Cow Feed To Buy: 
if not defined buycowfeed (
goto buycowfeed
)
set /a cowfeedtotal=%buycowfeed% * %cowfeedprice%
if %cowfeedtotal% GTR %money% (
echo.
echo.
echo Sorry, You Do Not Have Enough Money To Purchase That Much Cow Feed.
pause >nul
goto buycowfeed
)
echo.
echo.
echo Do You Really Want To Buy %buycowfeed% Serving{s} Of Cow Feed For $%cowfeedtotal%? (Y/N)
echo.
echo.
set /p choice2=
if not defined choice2 (
goto buycowfeed
)
echo.
echo.
if "%choice2%"=="y" goto ybuycowfeed
if "%choice2%"=="n" goto buycowfeed
echo Invalid Choice, Please Try Again!
pause >nul
goto buycowfeed
:ybuycowfeed
set /a cowfeed=%buycowfeed% + %cowfeed%
set /a money=%money% - %cowfeedtotal%
cls
echo      (Money : $%money%)   (Level : %level%)   (Energy : %energy%)
echo.
echo.
echo.
echo %buycowfeed% Serving{s} Of Cow Feed Have Been Purchased.
pause >nul
goto animalfeed
::######################################################################

:exit
cls
echo Thank You For Playing Farm Town.
ping -n 3 127.0.0.1 >nul
exit
::######################################################################

:save
cls
(echo pigfed=%pigfed%)> %name%.sav
(echo beef=%beef%)>> %name%.sav
(echo cornH=%cornH%)>> %name%.sav
(echo pigH=%pigH%)>> %name%.sav
(echo chickenH=%chickenH%)>> %name%.sav
(echo chickfed=%chickfed%)>> %name%.sav
(echo eggs=%eggs%)>> %name%.sav
(echo cowfed=%cowfed%)>> %name%.sav
(echo milk=%milk%)>> %name%.sav
(echo harvestwheat=%harvestwheat%)>> %name%.sav
(echo harvestbarley=%harvestbarley%)>> %name%.sav
(echo harvestcorn=%harvestcorn%)>> %name%.sav
(echo plantbarley=%plantbarley%)>> %name%.sav
(echo plantwheat=%plantwheat%)>> %name%.sav
(echo plantcorn=%plantcorn%)>> %name%.sav
(echo corn=%corn%)>> %name%.sav
(echo wheat=%wheat%)>> %name%.sav
(echo barley=%barley%)>> %name%.sav
(echo energy=%energy%)>> %name%.sav
(echo level=%level%)>> %name%.sav
(echo cow=%cow%)>> %name%.sav
(echo chicken=%chicken%)>> %name%.sav
(echo pig=%pig%)>> %name%.sav
(echo cowfeed=%cowfeed%)>> %name%.sav
(echo chickenfeed=%chickenfeed%)>> %name%.sav
(echo pigfeed=%pigfeed%)>> %name%.sav
(echo money=%money%)>> %name%.sav
(echo level=%level%)>> %name%.sav
echo      (Money : $%money%)   (Level : %level%)   (Energy : %energy%)
echo.
echo.
echo.
echo Your Game Has Been Saved
pause >nul
goto main
::######################################################################
:checklevel1up
cls
if not %level% EQU 1 goto back2main
if not %chickenH% GEQ 2 goto back2main
if not %pigH% GEQ 2 goto back2main
if not %cornH% GEQ 10 goto back2main
set level=2
echo      (Money : $%money%)   (Level : %level%)   (Energy : %energy%)
echo.
echo.
echo.
echo Level Up!
pause >nul
goto back2main
::######################################################################
