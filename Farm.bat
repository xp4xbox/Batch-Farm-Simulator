@echo off
TITLE Farm Town
color 1f
:start
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

:sets
cls
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
goto main

:load
cls
for /f %%a in (%name%.sav) do set %%a
goto main
::######################################################################
:main
cls
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
if "%M%"=="1" goto store
if "%M%"=="4" goto inventory
if "%M%"=="6" goto exit
if "%M%"=="5" goto save
echo.
echo Invalid Choice, Please Try Again!
pause >nul
goto main
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
if "%choice14%"=="n" goto harvestcorn2
echo Invalid Choice, Please Try Again.
pause >nul
goto harvestcorn2
:yharvestcorn
set /a harvestcorn=%plantcorn% + %harvestcorn%
set /a plantcorn=%plantcorn% - %harvestcorn%
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
if %plantebarley% LSS 1 (
echo.
echo.
echo You Must Plant At Least One Row of Barley.
pause >nul
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
if %plantewheat% LSS 1 (
echo.
echo.
echo You Must Plant At Least One Row of Wheat.
pause >nul
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
if %plantecorn% LSS 1 (
echo.
echo.
echo You Must Plant At Least One Row of Corn.
pause >nul
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
echo Number Of pig{s} : %pig%      Pig Feed : %pigfeed%	
echo -----------------------------------------------------
echo.
echo.
)
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
)
pause >nul
goto main
::######################################################################

:store
cls
echo      (Money : $%money%)   (Level : %level%)   (Energy : %energy%)
echo.
echo.
echo.
echo Welcome To The Store, What Would You Like To buy?
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
set barleyprice=3
cls
echo      (Money : $%money%)   (Level : %level%)   (Energy : %energy%)
echo.
echo.
echo.
echo Barley Seed Is Currently $3 Per Row.
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
if %barleytotal% LSS 1 (
echo.
echo.
echo You Must Choose At Least One Row Of Barley Seed.
pause >nul
goto buybarley
)
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
set wheatprice=2
cls
echo      (Money : $%money%)   (Level : %level%)   (Energy : %energy%)
echo.
echo.
echo.
echo Wheat Seed Is Currently $2 Per Row.
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
if %wheattotal% LSS 1 (
echo.
echo.
echo You Must Choose At Least One Row Of Wheat Seed.
pause >nul
goto buywheat
)
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
set cornprice=6
cls
echo      (Money : $%money%)   (Level : %level%)   (Energy : %energy%)
echo.
echo.
echo.
echo Corn Seed Is Currently $6 Per Row.
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
if %corntotal% LSS 1 (
echo.
echo.
echo You Must Choose At Least One Row Of Corn Seed.
pause >nul
goto buycorn
)
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
set pigprice=65
cls
echo      (Money : $%money%)   (Level : %level%)   (Energy : %energy%)
echo.
echo.
echo.
echo Pigs Are Currently $65 Each.
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
if %pigtotal% LSS 1 (
echo.
echo.
echo You Must Choose At Least One Pig.
pause >nul
goto buypig
)
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
set chickenprice=37
cls
echo      (Money : $%money%)   (Level : %level%)   (Energy : %energy%)
echo.
echo.
echo.
echo Chickens Are Currently $37 Each.
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
if %chickentotal% LSS 1 (
echo.
echo.
echo You Must Choose At Least One Chicken.
pause >nul
goto buychicken
)
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
set cowprice=100
cls
echo      (Money : $%money%)   (Level : %level%)   (Energy : %energy%)
echo.
echo.
echo.
echo Cows Are Currently $100 Each
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
if %cowtotal% LSS 1 (
echo.
echo.
echo You Must Choose At Least One Cow.
pause >nul
goto buycow
)
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
set pigfeedprice=5
cls
echo      (Money : $%money%)   (Level : %level%)   (Energy : %energy%)
echo.
echo.
echo.
echo Pig Feed Is Currently $5 Per Serving.
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
if %pigfeedtotal% LSS 1 (
echo.
echo.
echo You Must Choose At Least One Serving Of Pig Feed.
pause >nul
goto buypigfeed
)
if %pigfeedtotal% GTR %money% (
echo.
echo.
echo Sorry, You Do Not Have Enough Money To Purchase That Much Pig Feed.
pause >nul
goto buypigfeed
)
echo.
echo.
echo Do You Really Want To Buy %buypigfeed% Serving{s} Of Pig Feed For $%pigfeedtotal% ? (Y/N)
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
set chickenfeedprice=3
cls
echo      (Money : $%money%)   (Level : %level%)   (Energy : %energy%)
echo.
echo.
echo.
echo Chicken Feed Is Currently $3 Per Serving.
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
if %chickenfeedtotal% LSS 1 (
echo.
echo.
echo You Must Choose At Least One Serving Of Chicken Feed.
pause >nul
goto buychickenfeed
)
if %chickenfeedtotal% GTR %money% (
echo.
echo.
echo Sorry, You Do Not Have Enough Money To Purchase That Much Chicken Feed.
pause >nul
goto buychickenfeed
)
echo.
echo.
echo Do You Really Want To Buy %buychickenfeed% Serving{s} Of Chicken Feed For $%chickenfeedtotal% ? (Y/N)
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
set cowfeedprice=7
cls
echo      (Money : $%money%)   (Level : %level%)   (Energy : %energy%)
echo.
echo.
echo.
echo Cow Feed Is Currently $7 Per Serving.
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
if %cowfeedtotal% LSS 1 (
echo.
echo.
echo You Must Choose At Least One Serving Of Cow Feed.
pause >nul
goto buycowfeed
)
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
(echo harvestwheat=%harvestwheat%)> %name%.sav
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
