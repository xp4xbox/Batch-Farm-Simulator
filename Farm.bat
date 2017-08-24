::Farm Town Is An Open Source Batch Farm Simulator Made by Nicolas Hawrysh Currently v1.0

::To level up, you must buy 2 pigs, 2 chickens and 10 rows of corn.
::To level up to level 3, you must buy at least 1 cow and 20 rows of barley.

::Buying a tractor makes planting/harvesting use 0 energy

::There is a secret option that shows all history for purchased items if you type "history" in the main menu.
@echo off
TITLE Farm Town v1
color 1f
:start
set name=
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
set tractor=no
set tracH=0
set barleyH=0
set wheatH=0
set chickfeedH=0
set pigfeedH=0
set cowfeedH=0
set cowH=0
set cornH=0
set chickenH=0
set pigH=0
set chickenmeat=0
set beef=0
set ham=0
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
set loancurrent=no
set loanamtdue=0
goto setdefaultvalues

:load
cls
for /f %%a in (%name%.sav) do set %%a
goto setdefaultvalues

:setdefaultvalues

set energyprice=1

set beefsellprice=24
set eggsellprice=6
set milksellprice=130
set cornsellprice=12
set wheatsellprice=6
set barleysellprice=8
set hamsellprice=74
set chickensellprice=20
set tracsellprice=200

set tractorprice=300
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
set containerschickperchick=2
set containershamperpig=2

set energypercornrow=1
set energyperbarleyrow=1
set energyperwheatrow=1

set energypercornrowh=2
set energyperbarleyrowh=1
set energyperwheatrowh=1

set energy2feedcow=5
set energy2feedchick=1
set energy2feedpig=3

set energypercowmilk=5
set energyperchickegg=1

set energyperbutchcow=25
set energyperbutchchick=5
set energyperbutchpig=10

set interestrate=10
set maxloanlvl1=700
set maxloanlvl2=1000
set maxloanlvl3=1500
set minloanamount=50

set chanceforstorm=12
set chanceforcowdisease=15
::######################################################################
:main
::check to see if user can level up
if %level% EQU 1 goto checklevel1up
if %level% EQU 2 goto checklevel2up
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
echo 5) Go To The Bank
echo 6) Save Your Game
echo 7) Exit The Game
echo.
echo.
set /p M=
if not defined M (
goto main
)
if "%M%"=="2" goto harvestf
if "%M%"=="1" goto storeM
if "%M%"=="4" goto inventory
if "%M%"=="7" goto exit
if "%M%"=="6" goto save
if "%M%"=="3" goto tanimals
if "%M%"=="5" goto bank
if "%M%"=="history" goto history
echo.
echo Invalid Choice, Please Try Again!
pause >nul
goto main
::######################################################################
:bank
cls
echo      (Money : $%money%)   (Level : %level%)   (Energy : %energy%)
echo.
echo.
echo.
echo Welcome To The Bank, What Would You Like To Do?
echo.
echo.
echo 1) Receive Loan
echo 2) Pay Loan
echo 3) Back To Menu
echo.
echo.
set /p choicebank=
if not defined choicebank goto bank
if "%choicebank%"=="1" goto loan
if "%choicebank%"=="2" goto payloan
if "%choicebank%"=="3" goto main
echo.
echo Invalid Choice, Please Try Again!
pause >nul
goto bank
::######################################################################
:payloan
cls
echo      (Money : $%money%)   (Level : %level%)   (Energy : %energy%)
echo.
echo.
echo.
if "%loancurrent%"=="no" (
echo You Have No Loan Placed.
pause >nul
goto bank
)
echo You Currently Owe $%loanamtdue% To The Bank. 
echo.
echo.
echo How Much Would You Like To Pay? Please Type An Amount.
echo.
echo.
set /p a2pay=
echo.
echo.
if not defined a2pay goto payloan
if %a2pay% LSS 1 (
echo You Must Pay At Least $1!
pause >nul
goto payloan
)
set /a tmp=%a2pay% * 1
if %tmp% EQU 0 (
echo You Must Enter An Integer!
pause >nul
goto payloan
)
if %a2pay% GTR %loanamtdue% (
echo You Do Not Need To Pay Back That Much!
pause >nul
goto payloan
)
echo Are You Sure You Want To Pay Back $%a2pay%? Y/N
echo.
echo.
set /p yesno=
if not defined yesno goto payloan
if "%yesno%"=="y" goto ypayloan
if "%yesno%"=="n" goto bank
echo.
echo Invalid Choice, Please Try Again!
pause >nul
goto payloan
:ypayloan
set /a money=%money% - %a2pay%
set /a loanamtdue=%loanamtdue% - %a2pay%
cls
echo      (Money : $%money%)   (Level : %level%)   (Energy : %energy%)
echo.
echo.
echo.
if %loanamtdue% EQU 0 (
set loancurrent=no
echo You Have Payed Off Your Loan.
) else (
echo You Have Payed Part Of Your Loan.
)
pause >nul
goto bank
::######################################################################
:loan
cls
echo      (Money : $%money%)   (Level : %level%)   (Energy : %energy%)
echo.
echo.
echo.
if "%loancurrent%"=="yes" (
echo You Have Already Placed A Loan!
pause >nul
goto bank
)
echo How Much Money Would You Like To Borrow? Please Type An Amount.
echo.
echo.
set /p loanamount=
echo.
echo.
if not defined loanamount goto loan
set /a tmp=%loanamount% * 1
if %tmp% EQU 0 (
echo You Must Enter An Integer!
pause >nul
goto loan
)
if %loanamount% LSS %minloanamount% (
echo Your Loan Must Be $%minloanamount% Or Greater.
pause >nul
goto loan
)
if %level% EQU 1 (
if %loanamount% GTR %maxloanlvl1% (
echo Sorry, You Currently Can Only Borrow A Maximum Of $%maxloanlvl1% For Level 1.
pause >nul
goto loan
))
if %level% EQU 2 (
if %loanamount% GTR %maxloanlvl2% (
echo Sorry, You Currently Can Only Borrow A Maximum Of $%maxloanlvl2%For Level 2.
pause >nul
goto loan
))
if %level% EQU 3 (
if %loanamount% GTR %maxloanlvl3% (
echo Sorry, You Currently Can Only Borrow A Maximum Of $%maxloanlvl3% For Level 3.
pause >nul
goto loan
))
echo Interest Rate Is Currently %interestrate%%% Royalty Per Sell. Are You Sure You Want To Place The Loan? Y/N
echo.
echo.
set /p yesnoloan=
if not defined yesnoloan goto loan
if "%yesnoloan%"=="y" goto yplaceloan
if "%yesnoloan%"=="n" goto bank
echo.
echo Invalid Choice, Please Try Again!
pause >nul
goto loan
:yplaceloan
set /a money=%money% + %loanamount%
set loanamtdue=%loanamount%
set loancurrent=yes
cls
echo      (Money : $%money%)   (Level : %level%)   (Energy : %energy%)
echo.
echo.
echo.
echo You Have Placed Your Loan.
pause >nul
goto bank
::######################################################################
:tanimals
cls
echo      (Money : $%money%)   (Level : %level%)   (Energy : %energy%)
echo.
echo.
echo.
set /a rannum=%random% * %chanceforcowdisease% / 32768 + 1
if "%rannum%"=="2" (
set cowfed=0
set cow=0
echo A Disease Has Spread Through Your Cows. Unfortunatly None Of Them Have Survived.
pause >nul
)
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
if %level% LSS 3 (
echo Sorry, You Must Be At Level 3 To Collect Meat From Animals.
pause >nul 
goto tanimals
)
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
:meatPig
cls
echo      (Money : $%money%)   (Level : %level%)   (Energy : %energy%)
echo.
echo.
echo.
if %pig% LSS 1 (
echo You Don't Have Any Pigs!
pause >nul
goto collectMeat
)
if %pigfed% LSS 1 (
echo Sorry, Your Pigs Must Be Fed First.
pause >nul
goto collectMeat
)
echo How Many Pigs Worth Of Ham Would You Like To Collect? Please Type an Amount.
echo.
echo.
set /p ham2collect=
echo.
echo.
if not defined ham2collect goto meatPig
if %ham2collect% LSS 0 (
echo.
echo.
echo You Must Enter A Positive Integer!
pause >nul
goto meatPig
)
if %ham2collect% GTR %pigfed% (
echo Sorry, You Do Not Have Enough Fed Pigs. You Currently Have %pigfed% Fed Pig{s}.
pause >nul
goto meatPig
)
set /a energy2use=%energyperbutchpig% * %ham2collect%
if %energy2use% GTR %energy% (
echo Sorry, You Do Not Have Enough Energy To Butcher That Many Pigs.
pause >nul
goto meatPig
)
set /a ham2collectC=%ham2collect% * %containershamperpig%
echo Do You Really Want to Butcher %ham2collect% Pig{s} For %ham2collectC% Containers Of Ham? Y/N
echo.
echo.
set /p choice34=
if not defined choice34 goto meatPig
echo.
echo.
if "%choice34%"=="y" goto ycollectHam
if "%choice34%"=="n" goto collectMeat
echo Invalid Choice, Please Try Again.
pause >nul
goto meatPig
:ycollectHam
set /a pig=%pig% - %ham2collect%
set /a pigfed=%pigfed% - %ham2collect%
set /a ham=%ham% + %ham2collectC%
set /a energy=%energy% - %energy2use%
cls
echo      (Money : $%money%)   (Level : %level%)   (Energy : %energy%)
echo.
echo.
echo.
echo You Have Collected Your Ham.
pause >nul
goto collectMeat
::######################################################################
:meatChicken
cls
echo      (Money : $%money%)   (Level : %level%)   (Energy : %energy%)
echo.
echo.
echo.
if %chicken% LSS 1 (
echo You Don't Have Any Chickens!
pause >nul
goto collectMeat
)
if %chickfed% LSS 1 (
echo Sorry, Your Chickens Must Be Fed First.
pause >nul
goto collectMeat
)
echo How Many Chickens Worth Of Meat Would You Like To Collect? Please Type an Amount.
echo.
echo.
set /p chickmeat2collect=
echo.
echo.
if not defined chickmeat2collect goto meatChicken
if %chickmeat2collect% LSS 0 (
echo.
echo.
echo You Must Enter A Positive Integer!
pause >nul
goto meatChicken
)
if %chickmeat2collect% GTR %chickfed% (
echo Sorry, You Do Not Have Enough Fed Chickens. You Currently Have %chickfed% Fed Chicken{s}.
pause >nul
goto meatChicken
)
set /a energy2use=%energyperbutchchick% * %chickmeat2collect%
if %energy2use% GTR %energy% (
echo Sorry, You Do Not Have Enough Energy To Butcher That Many Chickens.
pause >nul
goto meatChicken
)
set /a chickmeat2collectC=%chickmeat2collect% * %containerschickperchick%
echo Do You Really Want to Butcher %chickmeat2collect% Chicken{s} For %chickmeat2collectC% Containers Of Chicken? Y/N
echo.
echo.
set /p choice33=
if not defined choice33 goto meatChicken
echo.
echo.
if "%choice33%"=="y" goto ycollectChickM
if "%choice33%"=="n" goto collectMeat
echo Invalid Choice, Please Try Again.
pause >nul
goto meatChicken
:ycollectChickM
set /a chicken=%chicken% - %chickmeat2collect%
set /a chickfed=%chickfed% - %chickmeat2collect%
set /a chickenmeat=%chickenmeat% + %chickmeat2collectC%
set /a energy=%energy% - %energy2use%
cls
echo      (Money : $%money%)   (Level : %level%)   (Energy : %energy%)
echo.
echo.
echo.
echo You Have Collected Your Chicken.
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
goto collectMeat
)
if %cowfed% LSS 1 (
echo Sorry, Your Cows Must Be Fed First.
pause >nul
goto collectMeat
)
echo How Many Cows Worth Of Beef Would You Like To Collect? Please Type an Amount.
echo.
echo.
set /p meat2collect=
echo.
echo.
if not defined meat2collect goto meatCow
if %meat2collect% LSS 0 (
echo.
echo.
echo You Must Enter A Positive Integer!
pause >nul
goto meatCow
)
if %meat2collect% GTR %cowfed% (
echo Sorry, You Do Not Have Enough Fed Cows. You Currently Have %cowfed% Fed Cow{s}.
pause >nul
goto meatCow
)
set /a energy2use=%energyperbutchcow% * %meat2collect%
if %energy2use% GTR %energy% (
echo Sorry, You Do Not Have Enough Energy To Butcher That Many Cows.
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
if "%choice31%"=="n" goto collectMeat
echo Invalid Choice, Please Try Again.
pause >nul
goto meatCow
:ycollectBe
set /a cow=%cow% - %meat2collect%
set /a cowfed=%cowfed% - %meat2collect%
set /a beef=%beef% + %meat2collectC%
set /a energy=%energy% - %energy2use%
cls
echo      (Money : $%money%)   (Level : %level%)   (Energy : %energy%)
echo.
echo.
echo.
echo You Have Collected Your Beef.
pause >nul
goto collectMeat
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
set /a energy2use=%energyperchickegg% * %chickfed%
if %energy2use% GTR %energy% (
echo Sorry, You Do Not Have Enough Energy To Collect That Many Eggs.
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
set /a energy=%energy% - %energy2use%
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
set /a energy2use=%energypercowmilk% * %cowfed%
if %energy2use% GTR %energy% (
echo Sorry, You Do Not Have Enough Energy To Milk All Of Your Cows.
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
set /a energy=%energy% - %energy2use%
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
set /a energy2use=%energy2feedpig% * %pig2feed%
if %energy2use% GTR %energy% (
echo Sorry, You Do Not Currently Have Enough Energy.
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
set /a energy=%energy% - %energy2use%
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
set /a energy2use=%energy2feedchick% * %chick2feed%
if %energy2use% GTR %energy% (
echo Sorry, You Do Not Currently Have Enough Energy.
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
set /a energy=%energy% - %energy2use%
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
set /a energy2use=%cow2feed% * %energy2feedcow%
if %energy2use% GTR %energy% (
echo Sorry, You Do Not Currently Have Enough Energy.
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
set /a energy=%energy% - %energy2use%
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
set /a rannum=%random% * %chanceforstorm% / 32768 + 1
if "%rannum%"=="2" (
set barley=0
set corn=0
set wheat=0
echo A Storm Has Came Through. Your Planted Crops Have Been Destroyed.
pause >nul
)
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
set /a energy2use=%energyperwheatrowh% * %plantwheat%
if "%tractor%"=="yes" set energy2use=0
if %energy2use% GTR %energy% (
echo.
echo.
echo.
echo Sorry, You Do Not Have Enough Energy To Harvest That Many Rows.
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
set /a energy=%energy% - %energy2use%
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
set /a energy2use=%energyperbarleyrowh% * %plantbarley%
if "%tractor%"=="yes" set energy2use=0
if %energy2use% GTR %energy% (
echo.
echo.
echo.
echo Sorry, You Do Not Have Enough Energy To Harvest That Many Rows.
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
set /a energy=%energy% - %energy2use%
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
set /a energy2use=%energypercornrowh% * %plantcorn%
if "%tractor%"=="yes" set energy2use=0
if %energy2use% GTR %energy% (
echo.
echo.
echo.
echo Sorry, You Do Not Have Enough Energy To Harvest That Many Rows.
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
set /a energy=%energy% - %energy2use%
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
if %plantebarley% LSS 0 (
echo.
echo.
echo You Must Enter A Positive Integer!
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
set /a energy2use=%energyperbarleyrow% * %plantebarley%
if "%tractor%"=="yes" set energy2use=0
if %energy2use% GTR %energy% (
echo.
echo.
echo Sorry, You Do Not Have Enough Energy To Plant That Many Rows.
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
set /a energy=%energy% - %energy2use%
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
if %plantewheat% LSS 0 (
echo.
echo.
echo You Must Enter A Positive Integer!
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
set /a energy2use=%energyperwheatrow% * %plantewheat%
if "%tractor%"=="yes" set energy2use=0
if %energy2use% GTR %energy% (
echo.
echo.
echo Sorry, You Do Not Have Enough Energy To Plant That Many Rows.
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
set /a energy=%energy% - %energy2Zuse%
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
if %plantecorn% LSS 0 (
echo.
echo.
echo You Must Enter A Positive Integer!
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
set /a energy2use=%energypercornrow% * %plantecorn%
if "%tractor%"=="yes" set energy2use=0
if %energy2use% GTR %energy% (
echo.
echo.
echo Sorry, You Do Not Have Enough Energy To Plant That Many Rows.
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
set /a energy=%energy% - %energy2use%
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
if %chickenmeat% GTR 0 (
echo Containers Of Chicken : %chickenmeat%
echo -----------------------------------------------------
echo.
echo.
)
if %ham% GTR 0 (
echo Containers Of Ham : %ham%
echo -----------------------------------------------------
echo.
echo.
)
if %tractor% GTR 0 (
echo Tractors : 1
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
echo 3) Buy Energy
echo 4) Back To Main Menu
echo.
echo.
set /p StoreMC=
if not defined StoreMC (
goto storeM
)
if "%StoreMC%"=="1" goto store
if "%StoreMC%"=="2" goto sell
if "%StoreMC%"=="3" goto buyenergy
if "%StoreMC%"=="4" goto main
echo.
echo Invalid Choice, Please Try Again!
pause >nul
goto storeM
::######################################################################
:buyenergy
cls
echo      (Money : $%money%)   (Level : %level%)   (Energy : %energy%)
echo.
echo.
echo.
echo Energy Is Currently $%energyprice% Each.
echo.
echo.
echo How Much Energy Would You Like To Buy? Please Type An Amount.
echo.
echo.
set /p buyenergy=Energy To Buy: 
if not defined buyenergy goto buyenergy
if %buyenergy% LSS 0 (
echo.
echo.
echo You Must Enter A Positive Integer!
pause >nul
goto buyenergy
)
set /a energytotal=%buyenergy% * %energyprice%
:: check for game breaking invalid input
if %energytotal% LSS 0 echo. & echo Error! & pause >nul & goto buyenergy
if %energytotal% GTR %money% (
echo.
echo.
echo Sorry, You Do Not Have Enough Money To Purchase That Much Energy.
pause >nul
goto buyenergy
)
echo.
echo.
echo Do You Really Want To Buy %buyenergy% Energy For $%energytotal%? (Y/N)
echo.
echo.
set /p choice37=
if not defined choice37 goto buyenergy
echo.
echo.
if "%choice37%"=="y" goto ybuyenergy
if "%choice37%"=="n" goto storeM
echo Invalid Choice, Please Try Again!
pause >nul
goto buyenergy
:ybuyenergy
set /a money=%money% - %energytotal%
set /a energy=%energy% + %buyenergy%
cls
echo      (Money : $%money%)   (Level : %level%)   (Energy : %energy%)
echo.
echo.
echo.
echo %buyenergy% Energy Has Been Purchased.
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
echo 5) Equipment
echo 6) Back To Main Menu
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
if "%sellC%"=="5" goto sellequi
if "%sellC%"=="6" goto main
echo.
echo Invalid Choice, Please Try Again.
pause >nul
goto sell
::######################################################################
:sellequi
cls
echo      (Money : $%money%)   (Level : %level%)   (Energy : %energy%)
echo.
echo.
echo.
echo What Equipment Would You Like To Sell?
echo.
echo.
echo 1) Tractor
echo 2) Back To Store
echo.
echo.
set /p sellequic=
if not defined sellequic goto sellequi
if "%sellequic%"=="1" goto selltrac
if "%sellequic%"=="2" goto sell
echo.
echo Invalid Choice, Please Try Again.
pause >nul
goto sellequi
::######################################################################
:selltrac
cls
echo      (Money : $%money%)   (Level : %level%)   (Energy : %energy%)
echo.
echo.
echo.
if "%tractor%"=="no" (
echo Sorry, You Currently Do Not Have A Tractor.
pause >nul
goto sellequi
)
echo A Used Tractor Is Currently Worth $%tracsellprice%.
echo.
echo.
echo Do You Really Want To Sell A Tractor For $%tracsellprice%? Y/N
echo.
echo.
set /p choiceyn=
if not defined choiceyn goto selltrac
echo.
echo.
if "%choiceyn%"=="y" goto yselltrac
if "%choiceyn%"=="n" goto sellequi
echo Invalid Choice, Please Try Again.
pause >nul
goto selltrac
:yselltrac
set tractor=no
set /a money=%money% + %tracsellprice%
if "%loancurrent%"=="no" goto skiploan2
set /a royal=%interestrate% * %tracsellprice% / 100
set /a money=%money% - %royal%
:skiploan2
cls
echo      (Money : $%money%)   (Level : %level%)   (Energy : %energy%)
echo.
echo.
echo.
echo You Have Sold Your Tractor.
pause >nul
goto sellequi
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
:sellChickenMeat
cls
echo      (Money : $%money%)   (Level : %level%)   (Energy : %energy%)
echo.
echo.
echo.
if %chickenmeat% LSS 1 (
echo Sorry, You Currently Have No Chicken To Sell.
pause >nul
goto sellMeat
)
echo A Container Of Chicken Is Currently Worth $%chickensellprice%.
echo.
echo.
echo How Many Containers Would You Like To Sell? Please Type An Amount.
echo.
echo.
set /p sellchicken=Chicken To Sell: 
if not defined sellchicken goto sellChickenMeat
if %sellchicken% LSS 0 (
echo.
echo.
echo You Must Enter A Positive Integer!
pause >nul
goto sellChickenMeat
)
if %sellchicken% GTR %chickenmeat% (
echo.
echo.
echo You Do Not Have Enough Chicken To Sell %sellchicken% Containers. You Currently Have %chickenmeat% Containers.
pause >nul
goto sellChickenMeat
)
echo.
echo.
set /a chickincome=%chickensellprice% * %sellchicken%
echo Do You Really Want To Sell %sellchicken% Containers For $%chickincome%? Y/N
echo.
echo.
set /p choice36=
if not defined choice36 goto sellChickenMeat
echo.
echo.
if "%choice36%"=="y" goto ysellchickMeat
if "%choice36%"=="n" goto sellMeat
echo Invalid Choice, Please Try Again.
pause >nul
goto sellChickenMeat
:ysellchickMeat
set /a chickenmeat=%chickenmeat% - %sellchicken%
set /a money=%money% + %chickincome%
if "%loancurrent%"=="no" goto skiploan2
set /a royal=%interestrate% * %chickincome% / 100
set /a money=%money% - %royal%
:skiploan2
cls
echo      (Money : $%money%)   (Level : %level%)   (Energy : %energy%)
echo.
echo.
echo.
echo You Have Sold Your Chicken.
pause >nul
goto sellMeat
::######################################################################
:sellHam
cls
echo      (Money : $%money%)   (Level : %level%)   (Energy : %energy%)
echo.
echo.
echo.
if %ham% LSS 1 (
echo Sorry, You Currently Have No Ham To Sell.
pause >nul
goto sellMeat
)
echo A Container Of Ham Is Currently Worth $%hamsellprice%.
echo.
echo.
echo How Many Containers Would You Like To Sell? Please Type An Amount.
echo.
echo.
set /p sellham=Ham To Sell: 
if not defined sellham goto sellHam
if %sellham% LSS 0 (
echo.
echo.
echo You Must Enter A Positive Integer!
pause >nul
goto sellHam
)
if %sellham% GTR %ham% (
echo.
echo.
echo You Do Not Have Enough Ham To Sell %sellham% Containers. You Currently Have %ham% Containers.
pause >nul
goto sellHam
)
echo.
echo.
set /a hamincome=%hamsellprice% * %sellham%
echo Do You Really Want To Sell %sellham% Containers For $%hamincome%? Y/N
echo.
echo.
set /p choice35=
if not defined choice35 goto sellHam
echo.
echo.
if "%choice35%"=="y" goto ysellham
if "%choice35%"=="n" goto sellMeat
echo Invalid Choice, Please Try Again.
pause >nul
goto sellHam
:ysellham
set /a ham=%ham% - %sellham%
set /a money=%money% + %hamincome%
if "%loancurrent%"=="no" goto skiploan
set /a royal=%interestrate% * %hamincome% / 100
set /a money=%money% - %royal%
:skiploan
cls
echo      (Money : $%money%)   (Level : %level%)   (Energy : %energy%)
echo.
echo.
echo.
echo You Have Sold Your Ham.
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
if %sellbeef% LSS 0 (
echo.
echo.
echo You Must Enter A Positive Integer!
pause >nul
goto sellBeef
)
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
if "%choice32%"=="n" goto sellMeat
echo Invalid Choice, Please Try Again.
pause >nul
goto sellBeef
:ysellbeef
set /a beef=%beef% - %sellbeef%
set /a money=%money% + %beefincome%
if "%loancurrent%"=="no" goto skiploan3
set /a royal=%interestrate% * %beefincome% / 100
set /a money=%money% - %royal%
:skiploan3
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
if %sellegg% LSS 0 (
echo.
echo.
echo You Must Enter A Positive Integer!
pause >nul
goto sellE
)
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
if "%loancurrent%"=="no" goto skiploan4
set /a royal=%interestrate% * %eggincome% / 100
set /a money=%money% - %royal%
:skiploan4
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
if %sellmilk% LSS 0 (
echo.
echo.
echo You Must Enter A Positive Integer!
pause >nul
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
if "%loancurrent%"=="no" goto skiploan5
set /a royal=%interestrate% * %milkincome% / 100
set /a money=%money% - %royal%
:skiploan5
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
if %sellcorn% LSS 0 (
echo.
echo.
echo You Must Enter A Positive Integer!
pause >nul
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
if "%loancurrent%"=="no" goto skiploan6
set /a royal=%interestrate% * %cornsellmoney% / 100
set /a money=%money% - %royal%
:skiploan6
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
if %sellwheat% LSS 0 (
echo.
echo.
echo You Must Enter A Positive Integer!
pause >nul
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
if "%loancurrent%"=="no" goto skiploan7
set /a royal=%interestrate% * %wheatsellmoney% / 100
set /a money=%money% - %royal%
:skiploan7
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
if %sellbarley% LSS 0 (
echo.
echo.
echo You Must Enter A Positive Integer!
pause >nul
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
if "%loancurrent%"=="no" goto skiploan8
set /a royal=%interestrate% * %barleysellmoney% / 100
set /a money=%money% - %royal%
:skiploan8
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
echo 4) Equipment
echo 5) Back To Main Menu
echo.
echo.
set /p S=
if not defined S (
goto store
)
if "%S%"=="1" goto crops
if "%S%"=="3" goto animalfeed
if "%S%"=="2" goto animal
if "%S%"=="4" goto buyequi
if "%S%"=="5" goto main
echo.
echo Invalid Choice, Please Try Again!
pause >nul
goto store
::######################################################################
:buyequi
cls
echo      (Money : $%money%)   (Level : %level%)   (Energy : %energy%)
echo.
echo.
echo.
echo What Equipment Would You Like To Buy?
echo.
echo.
echo 1) Tractor
echo 2) Back To Store
echo.
echo.
set /p echoic=
if not defined echoic goto buyequi
if "%echoic%"=="1" goto buytract
::if "%echoic%"=="2" goto buytruck
if "%echoic%"=="2" goto store
echo.
echo Invalid Choice. Please Try Again.
pause >nul
goto buyequi
::######################################################################
:buytract
cls
echo      (Money : $%money%)   (Level : %level%)   (Energy : %energy%)
echo.
echo.
echo.
if "%tractor%"=="yes" (
echo You Already Own A Tractor.
pause >nul
goto buyequi
)
echo A Tractor Is Currently $%tractorprice%.
echo.
echo.
if %money% LSS %tractorprice% (
echo Sorry, You Do Not Currently Have Enough Money To Purchase A Tractor.
pause >nul
goto buyequi
)
echo Do You Really Want To Buy A Tractor For $%tractorprice%? (Y/N)
echo.
echo.
set /p buyyn=
if not defined buyyn goto buytract
echo.
echo.
if "%buyyn%"=="y" goto ybuytract
if "%buyyn%"=="n" goto buyequi
echo Invalid Choice, Please Try Again.
pause >nul
goto buytract
:ybuytract
set tractor=yes
set /a money=%money% - %tractorprice%
set /a tracH=%tracH% + 1
cls
echo      (Money : $%money%)   (Level : %level%)   (Energy : %energy%)
echo.
echo.
echo.
echo A Tractor Has Been Purchased
pause >nul
goto buyequi
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
if %buybarley% LSS 0 (
echo.
echo.
echo You Must Enter A Positive Integer!
pause >nul
goto buybarley
)
set /a barleytotal=%buybarley% * %barleyprice%
if %barleytotal% LSS 0 echo. & echo Error! & pause >nul & goto buybarlet
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
if "%choice10%"=="n" goto crops
echo Invalid Choice, Please Try Again.
pause >nul
goto buybarley
:ybuybarley
set /a barley=%buybarley% + %barley%
set /a money=%money% - %barleytotal%
set /a barleyH=%barleyH% + %buybarley%
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
if %buywheat% LSS 0 (
echo.
echo.
echo You Must Enter A Positive Integer!
pause >nul
goto buywheat
)
set /a wheattotal=%buywheat% * %wheatprice%
if %wheattotal% LSS 0 echo. & echo Error! & pause >nul & goto buywheat
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
if "%choice9%"=="n" goto crops
echo Invalid Choice, Please Try Again.
pause >nul
goto buywheat
:ybuywheat
set /a wheat=%buywheat% + %wheat%
set /a money=%money% - %wheattotal%
set /a wheatH=%wheatH% + %buywheat%
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
if %buycorn% LSS 0 (
echo.
echo.
echo You Must Enter A Positive Integer!
pause >nul
goto buycorn
)
set /a corntotal=%buycorn% * %cornprice%
if %corntotal% LSS 0 echo. & echo Error! & pause >nul & goto buycorn
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
if "%choice8%"=="n" goto crops
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
if %buypig% LSS 0 (
echo.
echo.
echo You Must Enter A Positive Integer!
pause >nul
goto buypig
)
set /a pigtotal=%buypig% * %pigprice%
if %pigtotal% LSS 0 echo. & echo Error! & pause >nul & goto buypig
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
if "%choice6%"=="n" goto animal
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
if %buychicken% LSS 0 (
echo.
echo.
echo You Must Enter A Positive Integer!
pause >nul
goto buychicken
)
set /a chickentotal=%buychicken% * %chickenprice%
if %chickentotal% LSS 0 echo. & echo Error! & pause >nul & goto buychicken
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
if "%choice2%"=="n" goto animal
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
if %buycow% LSS 0 (
echo.
echo.
echo You Must Enter A Positive Integer!
pause >nul
goto buycow
)
set /a cowtotal=%buycow% * %cowprice%
if %cowtotal% LSS 0 echo. & echo Error! & pause >nul & goto buycow
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
if "%choice1%"=="n" goto animal
echo Invalid Choice, Please Try Again!
pause >nul
goto buycow
:ybuycow
set /a cow=%buycow% + %cow%
set /a money=%money% - %cowtotal%
set /a cowH=%cowH% + %buycow%
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
if %buypigfeed% LSS 0 (
echo.
echo.
echo You Must Enter A Positive Integer!
pause >nul
goto buypigfeed
)
set /a pigfeedtotal=%buypigfeed% * %pigfeedprice%
if %pigfeedtotal% LSS 0 echo. & echo Error! & pause >nul & goto buypigfeed
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
if "%choice7%"=="n" goto animalfeed
echo Invalid Choice, Please Try Again!
pause >nul
goto buypigfeed
:ybuypigfeed
set /a pigfeed=%buypigfeed% + %pigfeed%
set /a money=%money% - %pigfeedtotal%
set /a pigfeedH=%pigfeedH% + %buypigfeed%
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
if %buychickenfeed% LSS 0 (
echo.
echo.
echo You Must Enter A Positive Integer!
pause >nul
goto buychickenfeed
)
set /a chickenfeedtotal=%buychickenfeed% * %chickenfeedprice%
if %chickenfeedtotal% LSS 0 echo. & echo Error! & pause >nul & goto buychickenfeed
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
if "%choice4%"=="n" goto animalfeed
echo Invalid Choice, Please Try Again!
pause >nul
goto buychickenfeed
:ybuychickenfeed
set /a chickenfeed=%buychickenfeed% + %chickenfeed%
set /a money=%money% - %chickenfeedtotal%
set /a chickfeedH=%chickfeedH% + %buychickenfeed%
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
if %buycowfeed% LSS 0 (
echo.
echo.
echo You Must Enter A Positive Integer!
pause >nul
goto buycowfeed
)
set /a cowfeedtotal=%buycowfeed% * %cowfeedprice%
if %cowfeedtotal% LSS 0 echo. & echo Error! & pause >nul & goto buycowfeed
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
if "%choice2%"=="n" goto animalfeed
echo Invalid Choice, Please Try Again!
pause >nul
goto buycowfeed
:ybuycowfeed
set /a cowfeed=%buycowfeed% + %cowfeed%
set /a money=%money% - %cowfeedtotal%
set /a cowfeedH=%cowfeedH% + %buycowfeed%
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
echo.
echo.
echo Please Make Sure You Save Your Game. Are You Sure You Want To Exit? (Y/N)
echo.
echo.
set exityn=
set /p exityn=
if "%exityn%"=="y" exit
if "%exityn%"=="n" goto main
if not defined exityn goto exit
echo.
echo Invalid Choice, Please Try Again.
pause >nul
exit
::######################################################################
:history
cls
echo      (Money : $%money%)   (Level : %level%)   (Energy : %energy%)
echo.
echo.
echo.
echo Here Is A List Of Your Purchased Items :
echo.
echo.
echo.
echo ------------------Animals ^& Feed---------------------
echo.
echo.
echo.
if %cowH% GTR 0 (
echo Number Of Cow{s} : %cowH%      Cow Feed : %cowfeedH%
echo -----------------------------------------------------
echo.
echo.
)
if %chickenH% GTR 0 (
echo Number Of Chicken{s} : %chickenH%      Chicken Feed : %chickfeedH%	
echo -----------------------------------------------------
echo.
echo.
)
if %pigH% GTR 0 (
echo Number Of Pig{s} : %pigH%      Pig Feed : %pigfeedH%	
echo -----------------------------------------------------
echo.
echo.
echo.
)
echo -----------------------Crops-------------------------
echo.
echo.
echo.
if %cornH% GTR 0 (
echo Corn : %cornH%
echo -----------------------------------------------------
echo.
echo.
)
if %wheatH% GTR 0 (
echo Wheat : %wheatH%
echo -----------------------------------------------------
echo.
echo.
)
if %barleyH% GTR 0 (
echo Barley : %barleyH%
echo -----------------------------------------------------
echo.
echo.
)
echo ---------------------Equipment-----------------------
echo.
echo.
echo.
if %tracH% GTR 0 (
echo Tractors : %tracH%
echo -----------------------------------------------------
echo.
echo.
)
pause >nul
goto main
::######################################################################
:save
cls
(echo pigfed=%pigfed%)> %name%.sav
(echo tracH=%tracH%)>> %name%.sav
(echo tractor=%tractor%)>> %name%.sav
(echo loanamtdue=%loanamtdue%)>> %name%.sav
(echo loancurrent=%loancurrent%)>> %name%.sav
(echo barleyH=%barleyH%)>> %name%.sav
(echo wheatH=%wheatH%)>> %name%.sav
(echo pigfeedH=%pigfeedH%)>> %name%.sav
(echo chickfeedH=%chickfeedH%)>> %name%.sav
(echo cowfeedH=%cowfeedH%)>> %name%.sav
(echo chickenmeat=%chickenmeat%)>> %name%.sav
(echo ham=%ham%)>> %name%.sav
(echo beef=%beef%)>> %name%.sav
(echo cowH=%cowH%)>> %name%.sav
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
:checklevel2up
cls
if not %cowH% GEQ 1 goto back2main
if not %barleyH% GEQ 20 goto back2main
set level=3
echo      (Money : $%money%)   (Level : %level%)   (Energy : %energy%)
echo.
echo.
echo.
echo Level Up!
pause >nul
goto back2main
::######################################################################
