################################################################################
## Loading in the data and changing the name

install.packages("data.table")
library(readxl)
library(data.table)
library(dplyr)

SIMOA_Data_Cleaning_9_Jan_POC <- read_excel("SIMOA Data Cleaning 9 Jan POC.xlsx")
View(SIMOA_Data_Cleaning_9_Jan_POC)


## Renaming all the columns to change them from a ...# format to meaningful text 
## to allow me to better keep track of the variables I am using in the analysis
### An important note is that Q48 and 49 appear to be the same so I will confirm
### with Dr. Gardner if we should combine the questions into 1 as people do not
### appear to have answered both. Or if they are separate for a specific reason
### if they are, make sure to be clear why they are distinct. 
# Create a vector with the desired column names 

colnames(SIMOA)[1:339] <- c(
  "Record ID",
  "Consent timestamp",
  "Survey Completion",
  "Complete?",
  "Are you 65 or older?",
  "In the past two (2) years, have you 'regularly' taken a BZRA",
  "Stopped taking these medications? Yes or No",
  "Attempted to reduce or stop taking your sleeping pills at least once in the past two years?",
  "Do you live in a nursing home or long-term care facility?",
  "Complete?",
  "Survey start timestamp",
  "What is your age?",
  "What is your sex?",
  "What is your gender identity?",
  "Select the province or territory in which you currently live.",
  "What is the highest level of education you completed?",
  "What is your employment status?",
  "How often do you drive?",
  "Which category matches your annual household income?",
  "With whom do you currently live? Select all that apply.",
  "OSSS_1",
  "OSSS_2",
  "OSSS_3",
  "OSSS-3_score",
  "Complete?",
  "Rate your general health compared to other people the same age as you.",
  "Which of the following SLEEP conditions apply to you? Select all that apply.",
  "When you have a problem with sleep, which of the following apply? Select all that apply",
  "Which of the following PHYSICAL health conditions apply to you?",
  "Which of the following MENTAL health conditions do you live with?",
  "Count of health conditions, MANUAL calculation", 
  "PHQ_1",
  "PHQ_2",
  "PHQ_2_score",
  "Do you use a mobility aid (e.g., cane, walker, wheelchair, scooter)?",
  "Have you had any falls in the last two years?",
  "What happened as a result of your most serious fall?",
  "How many different types of medication do you take regularly?",
  "How often do you take a prescription opioid medication?",
  "I take too many medications",
  "I am comfortable with the amount of medications I take",
  "I would like to decrease the overall number of medications I take",
  "All my medications have an important purpose for my health",
  "What is your usual consumption of caffeine (e.g., coffee, tea, pop)?",
  "Do you use any nicotine products?",
  "What nicotine products do you use?",
  "How often do you use these products?",
  "How often do you drink alcohol? One standard drink of alcohol is equal to: Beer/Cider/Cooler: 341 ml (12 oz.) of 5% alcohol Wine: 142 ml (5 oz.) of 12% alcohol Spirits (rye, gin, rum, etc.): 43 ml (1.5 oz.) of 40% alcohol",
  "How often do you drink alcohol? One standard drink of alcohol is equal to: Beer/Cider/Cooler: 341 ml (12 oz.) of 5% alcohol Wine: 142 ml (5 oz.) of 12% alcohol Spirits (rye, gin, rum, etc.): 43 ml (1.5 oz.) of 40% alcohol",
  "How often do you use cannabis products (of any kind)?",
  "What do you use cannabis for? Select all that apply",
  "Complete?",
  "Which of the listed prescription sleeping pills have you taken 'regularly' in the past two (2) years?",
  "How often are you currently taking them?",
  "ALPRAZOLAM days/week",
  "ALPRAZOLAM usual total dose",
  "'Other': ALPRAZOLAM usual daily dose in mg",
  "BROMAZEPAM days/week",
  "BROMAZEPAM usual total dose",
  "'Other': BROMAZEPAM usual daily dose in mg",
  "CHLORDIAZEPOXIDE days/week",
  "CHLORDIAZEPOXIDE usual total dose",
  "'Other': CHLORDIAZEPOXIDE usual daily dose in mg",
  "CLONAZEPAM days/week",
  "CLONAZEPAM usual total dose",
  "'Other':  CLONAZEPAM usual daily dose in mg",
  "DIAZEPAM days/week",
  "DIAZEPAM usual total dose",
  "'Other':  DIAZEPAM usual daily dose in mg",
  "ESZOPICLONE days/week",
  "ESZOPICLONE usual total dose",
  "'Other':  ESZOPICLONE usual daily dose in mg",
  "FLURAZEPAM days/week",
  "FLURAZEPAM usual total dose",
  "'Other':  FLURAZEPAM usual daily dose in mg",
  "LORAZEPAM days/week",
  "LORAZEPAM usual total dose",
  "'Other':  LORAZEPAM usual daily dose in mg",
  "NITRAZEPAM days/week",
  "NITRAZEPAM usual total dose",
  "'Other':  NITRAZEPAM usual daily dose in mg",
  "OXAZEPAM days/week",
  "OXAZEPAM usual total dose",
  "'Other':  OXAZEPAM usual daily dose in mg",
  "TEMAZEPAM days/week",
  "TEMAZEPAM usual total dose",
  "'Other':  TEMAZEPAM usual daily dose in mg",
  "TRIAZOLAM days/week",
  "TRIAZOLAM usual total dose",
  "'Other':  TRIAZOLAM usual daily dose in mg",
  "ZOLPIDEM days/week",
  "ZOLPIDEM usual total dose",
  "'Other':  ZOLPIDEM usual daily dose in mg",
  "ZOPICLONE days/week",
  "ZOPICLONE usual total dose",
  "'Other':  ZOPICLONE usual daily dose in mg.",
  "How many days per week did you regularly take ALPRAZOLAM? Choose the highest option that applies to you in the past 2 years.",
  "On the days that you took ALPRAZOLAM, what was your usual total daily dose?",
  "'Other': What was your usual dose of ALPRAZOLAM? Indicate the dose as the number of mg per 24 hours.",
  "How many days per week did you regularly take BROMAZEPAM?",
  "On the days that you took BROMAZEPAM, what was your usual total daily dose?",
  "'Other': What was your usual dose of BROMAZEPAM? Indicate the dose as the number of mg per 24 hours.",
  "How many days per week did you regularly take CHLORDIAZEPOXIDE? Choose the highest option that applies to you in the past 2 years.",
  "On the days that you took CHLORDIAZEPOXIDE, what was your usual total daily dose?",
  "'Other': What was your usual dose of CHLORDIAZEPOXIDE? Indicate the dose as the number of mg per 24 hours.",
  "How many days per week did you regularly take CLONAZEPAM? Choose the highest option that applies to you in the past 2 years.",
  "On the days that you took CLONAZEPAM, what was your usual total daily dose?",
  "'Other': What was your usual dose of CLONAZEPAM? Indicate the dose as the number of mg per 24 hours.",
  "How many days per week did you regularly take DIAZEPAM? Choose the highest option that applies to you in the past 2 years.",
  "On the days that you took DIAZEPAM, what was your usual total daily dose?",
  "'Other': What was your usual dose of DIAZEPAM? Indicate the dose as the number of mg per 24 hours.",
  "How many days per week did you regularly take ESZOPICLONE? Choose the highest option that applies to you in the past 2 years.",
  "On the days that you took ESZOPICLONE, what was your usual total daily dose?",
  "'Other': What was your usual dose of ESZOPICLONE? Indicate the dose as the number of mg per 24 hours.",
  "How many days per week did you regularly take FLURAZEPAM? Choose the highest option that applies to you in the past 2 years.",
  "On the days that you took FLURAZEPAM, what was your usual total daily dose?",
  "'Other': What was your usual dose of FLURAZEPAM? Indicate the dose as the number of mg per 24 hours.",
  "How many days per week did you regularly take LORAZEPAM? Choose the highest option that applies to you in the past 2 years.",
  "On the days that you took LORAZEPAM, what was your usual total daily dose?",
  "'Other': What was your usual dose of LORAZEPAM? Indicate the dose as the number of mg per 24 hours.",
  "How many days per week did you regularly take NITRAZEPAM? Choose the highest option that applies to you in the past 2 years.",
  "On the days that you took NITRAZEPAM, what was your usual total daily dose?",
  "'Other': What was your usual dose of NITRAZEPAM? Indicate the dose as the number of mg per 24 hours.",
  "How many days per week did you regularly take OXAZEPAM? Choose the highest option that applies to you in the past 2 years.",
  "On the days that you took OXAZEPAM, what was your usual total daily dose?",
  "'Other': What was your usual dose of OXAZEPAM? Indicate the dose as the number of mg per 24 hours.",
  "How many days per week did you regularly take TEMAZEPAM? Choose the highest option that applies to you in the past 2 years.",
  "On the days that you took TEMAZEPAM, what was your usual total daily dose?",
  "'Other': What was your usual dose of TEMAZEPAM? Indicate the dose as the number of mg per 24 hours.",
  "How many days per week did you regularly take TRIAZOLAM? Choose the highest option that applies to you in the past 2 years.",
  "On the days that you took TRIAZOLAM, what was your usual total daily dose?",
  "'Other': What was your usual dose of TRIAZOLAM? Indicate the dose as the number of mg per 24 hours.",
  "How many days per week did you regularly take ZOLPIDEM? Choose the highest option that applies to you in the past 2 years.",
  "On the days that you took ZOLPIDEM, what was your usual total daily dose?",
  "'Other': What was your usual dose of ZOLPIDEM? Indicate the dose as the number of mg per 24 hours.",
  "How many days per week did you regularly take ZOPICLONE? Choose the highest option that applies to you in the past 2 years.",
  "On the days that you took ZOPICLONE, what was your usual total daily dose?",
  "'Other': What was your usual dose of ZOPICLONE? Indicate the dose as the number of mg per 24 hours.",
  "Estimate how many years you have taken medications to help you sleep. If you have taken more than one type of sleeping pill you can add up the total time for your estimate.",
  "How did you attempt to stop taking the sleep medication?",
  "How did you stop taking the sleep medication?",
  "Did you do any of the following when reducing your dose? Select all that apply. Splitting tablets (for example into 2 or 4 pieces) can be used to help you gradually reduce your dose over time. Some pharmacies can make a liquid formulation for the same purpose.",
  "Did you do any of the following when reducing your dose? Select all that apply. Splitting tablets (for example into 2 or 4 pieces) can be used to help you gradually reduce your dose over time. Some pharmacies can make a liquid formulation for the same purpose.",
  "What was the longest period of time that you completely stopped taking your sleep medication (within the past 2 years)?",
  "Which of the following 'withdrawal effects' did you experience when reducing the dose or fully stopping your sleep medication? Select all that apply: Insomnia: poor sleep or worsening sleep problems; Anxiety: feeling anxious, irritable, agitated, jittery, on edge, tense, worried, restless, racing thoughts; Other mental health effects: difficulty concentrating, depressed mood, memory problems, confusion; Physical effects: nausea, dizzy, unsteady, headaches, sweating, tremulous, shaky, pounding heart, sensitive to noise or light.",
  "Which of the following 'withdrawal effects' did you experience when reducing the dose or fully stopping your sleep medication? Select all that apply: Insomnia: poor sleep or worsening sleep problems; Anxiety: feeling anxious, irritable, agitated, jittery, on edge, tense, worried, restless, racing thoughts; Other mental health effects: difficulty concentrating, depressed mood, memory problems, confusion; Physical effects: nausea, dizzy, unsteady, headaches, sweating, tremulous, shaky, pounding heart, sensitive to noise or light.",
  "Were any of the following methods used when decreasing or stopping your sleeping pills? Select all that apply.",
  "Were any of the following methods used when decreasing or stopping your sleeping pills? Select all that apply.",
  "Do you intend to completely stop using sleeping pills within the next year?",
  "Complete?",
  "Do you use any other medications or substances to help you sleep? Select all that apply",
  "How often do you use alcohol to help you sleep?",
  "How often do you use cannabis to help you sleep?",
  "How often do you use melatonin to help you sleep?",
  "How often do you use opioids to help you sleep?",
  "How often do you use quetiapine to help you sleep?",
  "How often do you use trazodone to help you sleep?",
  "How often do you use sedating antihistamines to help you sleep? (e.g. Benadryl, Gravol, Sleepeze, etc.)",
  "How often do you use [other_sub_use] to help you sleep?",
  "Continue with survey? Thank you for your responses so far. You have completed 4 of 10 sections. Would you like to continue with the survey now or save your responses and come back later?",
  "Complete?",
  "Taking my sleeping pills is important for my overall health and wellness.",
  "I rely on sleeping pills to give me a good night's sleep.",
  "I rely on my sleeping pills to get enough sleep.",
  "Taking sleeping pills is the best way to fix my sleep problem.",
  "I feel better when I take my sleeping pills after not taking them for a night or two.",
  "I feel drowsy the morning after taking my sleeping pills.",
  "My sleeping pills make me feel unsteady on my feet.",
  "Stopped - I have fallen because of my sleeping pills.",
  "Taking sleeping pills is bad for my memory.",
  "Taking sleeping pills makes me an unsafe driver the next day.",
  "I feel that my sleeping pills are perfectly safe for me to use.",
  "I sometimes take more of my sleeping pills than prescribed.",
  "I limit how much alcohol I drink because I take sleeping pills.",
  "Taking sleeping pills interferes with my daytime activities (e.g. chores, errands, hobbies, work).",
  "Taking sleeping pills negatively impacts my social life.",
  "I feel like I am dependent on my sleeping pills.",
  "I worry about running out of my sleeping pills.",
  "I feel bad physically when I reduce the dose or don't take my sleeping pills.",
  "It is discouraging when I try to stop using my sleeping pills but can't.",
  "I feel like a failure when I try to stop my sleeping pills but can't.",
  "I regret that I ever started taking sleeping pills.",
  "I want to stop my sleeping pills.",
  "My prescriber wants me to stop my sleeping pills.",
  "My pharmacist wants me to stop my sleeping pills.",
  "I am capable of stopping my sleeping pills.",
  "I need help to stop my sleeping pills.",
  "My family and/or friends worry about my sleeping pill use.",
  "My family and/or friends have encouraged me to stop taking sleeping pills.",
  "I'm ashamed that I take sleeping pills.",
  "My prescriber thinks using sleeping pills is good for my health.",
  "My prescriber and I regularly review my sleeping pill use.",
  "My pharmacist thinks using sleeping pills is good for my health.",
  "My pharmacist and I regularly review my sleeping pill use.",
  "Taking my sleeping pills was important for my overall health and wellness.",
  "I relied on my sleeping pills to give me a good night's sleep.",
  "I relied on my sleeping pills to get enough sleep.",
  "Taking sleeping pills was the best way to fix my sleep problem.",
  "I felt better when I took my sleeping pills after not taking them for a night or two.",
  "I felt drowsy the morning after taking my sleeping pills.",
  "My sleeping pills made me feel unsteady on my feet.",
  "Would - I have fallen because of my sleeping pills.",
  "Taking sleeping pills was bad for my memory.",
  "Taking sleeping pills made me an unsafe driver the next day.",
  "I felt that my sleeping pills were perfectly safe for me to use.",
  "I sometimes took more of my sleeping pills than prescribed.",
  "I limited how much alcohol I drank because I took sleeping pills.",
  "Taking sleeping pills interfered with my daytime activities (e.g. chores, errands, hobbies, work).",
  "Taking sleeping pills negatively impacted my social life.",
  "I felt like I was dependent on my sleeping pills.",
  "I worried about running out of my sleeping pills.",
  "I felt bad physically when I reduced the dose or didn't take my sleeping pills.",
  "It was discouraging when I tried to stop using my sleeping pills but couldn't.",
  "I felt like a failure when I tried to stop my sleeping pills but couldn't.",
  "I regretted that I ever started taking sleeping pills.",
  "I wanted to stop my sleeping pills.",
  "My prescriber wanted me to stop my sleeping pills.",
  "My pharmacist wanted me to stop my sleeping pills.",
  "I was capable of stopping my sleeping pills.",
  "I needed help to stop my sleeping pills.",
  "My family and/or friends worried about my sleeping pill use.",
  "My family and/or friends encouraged me to stop taking sleeping pills.",
  "I was ashamed that I took sleeping pills.",
  "My prescriber thought using sleeping pills was good for my health.",
  "My prescriber and I regularly reviewed my sleeping pill use.",
  "My pharmacist thought using sleeping pills was good for my health.",
  "My pharmacist and I regularly reviewed my sleeping pill use.",
  "Continue with survey? We really appreciate your participation and responses so far and understand that this is a very long survey. You just completed the longest section. The remaining survey sections are not nearly as long. Would you like to continue with the survey now or save your responses and come back later?",
  "Complete?",
  "Stopped - I experienced memory problems.",
  "Stopped - I had trouble thinking clearly.",
  "Stopped - They interfered with my daytime activities (e.g. chores, errands, hobbies, work).",
  "Stopped - They interfered with my ability to socialize.",
  "Stopped - They made me a less safe driver.",
  "Stopped - I had balance problems.",
  "Stopped - I had one or more falls.",
  "Stopped - I didn't have a sleep problem anymore.",
  "Stopped - They weren't working for me anymore.",
  "Stopped - I found a different and better way to help my sleep problem.",
  "Stopped - People close to me (e.g. family, friends) said they were concerned about me taking them.",
  "Stopped - My prescriber wanted me to stop taking them.",
  "Stopped - My pharmacist wanted me to stop taking them.",
  "Stopped - They caused problems with my other medications.",
  "Stopped - I developed a dependence problem with them.",
  "Stopped - I learned a safe and effective way to stop them.",
  "Stopped - They cost too much.",
  "Would - I experienced memory problems.",
  "Would - I had trouble thinking clearly.",
  "Would - They interfered with my daytime activities (e.g. chores, errands, hobbies, work).",
  "Would - They interfered with my ability to socialize.",
  "Would - They made me a less safe driver.",
  "Would - I had balance problems.",
  "Would - I had one or more falls.",
  "Would - I didn't have a sleep problem anymore.",
  "Would - They weren't working for me anymore.",
  "Would - I found a different and better way to help my sleep problem.",
  "Would - People close to me (e.g. family, friends) said they were concerned about me taking them.",
  "Would - My prescriber wanted me to stop taking them.",
  "Would - My pharmacist wanted me to stop taking them.",
  "Would - They caused problems with my other medications.",
  "Would - I developed a dependence problem with them.",
  "Would - I learned a safe and effective way to stop them.",
  "Would - They cost too much.",
  "Complete?",
  "I need 8 hours of sleep to feel refreshed and function well during the day.",
  "When I don't get the proper amount of sleep on a given night, I need to catch up the next day by napping or on the next night by sleeping longer.",
  "I am concerned that chronic insomnia may have serious consequences on my physical health.",
  "I am worried that I may lose control over my abilities to sleep.",
  "After a poor night's sleep, I know that it will interfere with my daily activities the next day.",
  "In order to be alert and function well during the day, I believe I would be better off taking a sleeping pill rather than having a poor night's sleep.",
  "When I feel irritable, depressed, or anxious during the day, it is mostly because I did not sleep well the night before.",
  "When I sleep poorly on one night, I know it will disturb my sleep schedule for the whole week.",
  "Without an adequate night's sleep, I can hardly function the next day.",
  "I can't ever predict whether I'll have a good or poor night's sleep.",
  "I have little ability to manage the negative consequences of disturbed sleep.",
  "When I feel tired, have no energy, or just seem not to function well during the day, it is generally because I did not sleep well the night before.",
  "I believe insomnia is essentially the result of a chemical imbalance.",
  "I feel insomnia is ruining my ability to enjoy life and prevents me from doing what I want.",
  "Medication is probably the only solution to sleeplessness.",
  "I avoid or cancel obligations (social, family) after a poor night's sleep.",
  "DBAS-16 score",
  "Complete?",
  "I see myself as someone who IS RESERVED.",
  "I see myself as someone who IS GENERALLY TRUSTING.",
  "I see myself as someone who TENDS TO BE LAZY.",
  "I see myself as someone who IS RELAXED, HANDLES STRESS WELL.",
  "I see myself as someone who HAS FEW ARTISTIC INTERESTS.",
  "I see myself as someone who IS OUTGOING, SOCIABLE.",
  "I see myself as someone who TENDS TO FIND FAULT WITH OTHERS.",
  "I see myself as someone who DOES A THOROUGH JOB.",
  "I see myself as someone who GETS NERVOUS EASILY.",
  "I see myself as someone who HAS AN ACTIVE IMAGINATION.",
  "Complete?",
  "I am content.",
  "I often don't think things through before I speak.",
  "I would like to skydive.",
  "I am happy.",
  "I often involve myself in situations that I later regret being involved in.",
  "I enjoy new and exciting experiences even if they are unconventional.",
  "I have faith that my future holds great promise.",
  "It's frightening to feel dizzy or faint.",
  "I like doing things that frighten me a little.",
  "It frightens me when I feel my heart beat change.",
  "I usually act without stopping to think.",
  "I would like to learn how to drive a motorcycle.",
  "I feel proud of my accomplishments.",
  "I get scared when I'm too nervous.",
  "Generally, I am an impulsive person.",
  "I am interested in experience for its own sake even if it is illegal.",
  "I feel that I'm a failure.",
  "I get scared when I experience unusual body sensations.",
  "I would enjoy hiking long distances in wild and uninhabited territory.",
  "I feel pleasant.",
  "It scares me when I'm unable to focus on a task.",
  "I feel I have to be manipulative to get what I want.",
  "I am very enthusiastic about my future.",
  "Complete?",
  "Take some time off and get away from the situation.",
  "Focus on the problem and see how I can solve it.",
  "Blame myself for having gotten into this situation.",
  "Treat myself to a favorite food or snack.",
  "Feel anxious about not being able to cope.",
  "Think about how I solved similar problems.",
  "Visit a friend.",
  "Determine a course of action and follow it.",
  "Buy myself something.",
  "Blame myself for being too emotional about the situation.",
  "Work to understand the situation.",
  "Become very upset.",
  "Take corrective action immediately.",
  "Blame myself for not knowing what to do.",
  "Spend time with a special person.",
  "Think about the event and learn from my mistakes.",
  "Wish that I could change what had happened or how I felt.",
  "Go out for a snack or meal.",
  "Analyze my problem before reacting.",
  "Focus on my general inadequacies.",
  "Phone a friend.",
  "Complete?"
)

############################################
############################################
## Now that the columns have been renamed to something more normal, I will 
## remove the r=first row which outlined the questions. This does not remove any 
## data as this row was used to hold information about the questions but since 
## the columns have been renamed, this is no longer needed.

SIMOA <- SIMOA[-1, ]

############################################
############################################
## I will now remove the columns that do not hold any data that is important 
## such as the consent time stamp and the "Complete?" columns as they do not 
## provide information and simply take up space making the process of going 
## through all the data more complex

SIMOA <- SIMOA[, !colnames(SIMOA) %in% 
                 c("Complete?", "Consent timestamp", "Survey Completion", "Survey start timestamp", 
                   "Continue with survey? Thank you for your responses so far. You have completed 4 of 10 sections. Would you like to continue with the survey now or save your responses and come back later?",
                   "Continue with survey? We really appreciate your participation and responses so far and understand that this is a very long survey. You just completed the longest section. The remaining survey sections are not nearly as long. Would you like to continue with the survey now or save your responses and come back later?")]

################################################################################
################################################################################
## This is the code I used to calculate the mean and sd for the age column of 
## the SIMOA sample. The first line here converts the blank columns to NA which 
## allows the rest of the analysis to proceed. NOTE: R will not calculate a mean 
## if you do not do this because it is unsure how to handle missing data. The 
## seocnd line converts the column to numeric data so other tests can be ran. 
## The line after that is used to make sure the data class has changed to 
## numeric successfully. The next line is used to get the mean age for my sample 
## and the na.rm = TRUE which essentially makes R calculate the mean of that 
## column without counting the columns with an "NA" from the previous line. The 
## next line calculates the sd for the age data again using the na.rm = TRUE 
## function in order to only count the rows with data. Finally, I am looking for 
## the number of people R used in calculating the mean and sd. 

NA -> SIMOA$`What is your age?`[SIMOA$`What is your age?` == ""]
SIMOA$`What is your age?` <- as.numeric(SIMOA$`What is your age?`)
class(SIMOA$`What is your age?`)
AGE_mean<- mean(SIMOA$`What is your age?`, na.rm = TRUE)
AGE_sd <- sd(SIMOA$`What is your age?`, na.rm = TRUE)
AGE_N <- sum(!is.na(SIMOA$`What is your age?`))

## These lines of code are used to show the results of the previous code. The 
## first line prints the mean age I previously calculated. The second line 
## prints the sd of the age I previously calculated. The last line prints the 
## number of people R used in making the previous calculations. NOTE: I am not
## sure what the "\n" component does but its included
print(AGE_mean)
print(AGE_sd)
cat("N =", AGE_N, "\n")

################################################################################
################################################################################
# Get a frequency table for the 'SEX' column
SEX <- table(SIMOA$`What is your sex?`)

# Print the frequency table
print(SEX)

## Extract the count for 'male' from the table. It also prints the number and 
## finds the % female
SEX_M <- SEX["Male"]
SEX_F <- SEX["Female"]
print(SEX_M)
print(SEX_F)

FEMALE_PERCENT <- (((AGE_N / SEX_F)-1)*100)
print(FEMALE_PERCENT)

################################################################################
################################################################################
# Get a frequency table for the 'Gender' column
GENDER <- table(SIMOA$`What is your gender identity?`)

# Print the frequency table
print(GENDER)

## Extract the count for 'Man' from the table. It also prints the number and 
## finds the % female
GENDER_M <- GENDER["Man"]
GENDER_F <- GENDER["Woman"]
GENDER_NB <- GENDER["Non-binary"]
print(GENDER_M)
print(GENDER_F)
print(GENDER_NB)


WOMAN_PERCENT <- (((513 / GENDER_F)-1)*100)
print(WOMAN_PERCENT)

################################################################################
################################################################################
## For some reason the alcohol question appeared twice. As a result I needed to
## combine these column. Below is the code to combine these columns and have 
## renamed 'Alcohol'
# Combine the two columns into a new column called Alcohol
SIMOA$Alcohol <- paste(
  ifelse(is.na(SIMOA[[42]]), "", SIMOA[[42]]), 
  ifelse(is.na(SIMOA[[43]]), "", SIMOA[[43]]), 
  sep = " "
)

## Below is the code I used to get rid of th columns containing the 2 alcohol 
## questions since the code just above combined them to a new column
# NOTE: Rather then removing both columns at the same time I removed column 42 
# first (to ensure this would work properly) and when that worked, I was able
# to remove column 42 again as the duplicate alcohol question occupied that 
# column

SIMOA <- SIMOA[, -42]

## I will repeat this for all the duplicate variable names and specify which
## questions I did this for
# Combine "Did you do any of the following when reducing your dose?" and 
# removing the duplicated column (run twice like the code above)

SIMOA$Reduce_Dose <- paste(
  ifelse(is.na(SIMOA[[133]]), "", SIMOA[[133]]), 
  ifelse(is.na(SIMOA[[134]]), "", SIMOA[[134]]), 
  sep = " "
)

SIMOA <- SIMOA[, -133]

# Combine "Which of the following 'withdrawal effects' did you experience when 
# reducing the dose or fully stopping your sleep medication? Select all that 
# apply: Insomnia: poor sleep or worsening sleep problems; Anxiety: feeling 
# anxious, irritable, agitated, jittery, on edge, tense, worried, restless, 
# racing thoughts; Other mental health effects: difficulty concentrating, 
# depressed mood, memory problems, confusion; Physical effects: nausea, dizzy, 
# unsteady, headaches, sweating, tremulous, shaky, pounding heart, sensitive to 
# noise or light" and removing the duplicated column 
# (run twice like the code above)

SIMOA$Reduce_Dose <- paste(
  ifelse(is.na(SIMOA[[134]]), "", SIMOA[[134]]), 
  ifelse(is.na(SIMOA[[135]]), "", SIMOA[[135]]), 
  sep = " "
)

SIMOA <- SIMOA[, -134]

# Combine "Were any of the following methods used when decreasing or stopping 
# your sleeping pills? Select all that apply." Removing the duplicated column 
# (run twice like the code above)

SIMOA$Methods_for_Decrease <- paste(
  ifelse(is.na(SIMOA[[134]]), "", SIMOA[[134]]), 
  ifelse(is.na(SIMOA[[135]]), "", SIMOA[[135]]), 
  sep = " "
)

SIMOA <- SIMOA[, -134]

#############################
#############################
## Below are columns with the same name but they are looking at adverse effects
## at different times. One question is asking about past sleeping pills they 
## were taking in the past whereas the other one is asking about the BZRA they
## are currently taking - I have changed the names at the start of the code when
## I needed to get the column names. I will keep this code just in case it 
## doesn't work or if I need to rename another column, I'll still have the code.
#colnames(SIMOA)[151] <- "Stopped - I have fallen because of my sleeping pills."
#colnames(SIMOA)[184] <- "Would - I have fallen because of my sleeping pills."
#colnames(SIMOA)[210] <- "Stopped - I experienced memory problems."
#colnames(SIMOA)[227] <- "Would - I experienced memory problems."
#colnames(SIMOA)[211] <- "Stopped - I had trouble thinking clearly."
#colnames(SIMOA)[228] <- "Would - I had trouble thinking clearly."
#colnames(SIMOA)[212] <- "Stopped - They interfered with my daytime activities (e.g. chores, errands, hobbies, work)."
#colnames(SIMOA)[229] <- "Would - They interfered with my daytime activities (e.g. chores, errands, hobbies, work)."
#colnames(SIMOA)[213] <- "Stopped - They interfered with my ability to socialize."
#colnames(SIMOA)[230] <- "Would - They interfered with my ability to socialize."
#colnames(SIMOA)[214] <- "Stopped - They made me a less safe driver."
#colnames(SIMOA)[231] <- "Would - They made me a less safe driver."
#colnames(SIMOA)[215] <- "Stopped - I had balance problems."
#colnames(SIMOA)[232] <- "Would - I had balance problems."
#colnames(SIMOA)[216] <- "Stopped - I had one or more falls."
#colnames(SIMOA)[233] <- "Would - I had one or more falls."
#colnames(SIMOA)[217] <- "Stopped - I didn't have a sleep problem anymore."
#colnames(SIMOA)[234] <- "Would - I didn't have a sleep problem anymore."
#colnames(SIMOA)[218] <- "Stopped - They weren't working for me anymore."
#colnames(SIMOA)[235] <- "Would - They weren't working for me anymore."
#colnames(SIMOA)[219] <- "Stopped - I found a different and better way to help my sleep problem."
#colnames(SIMOA)[236] <- "Would - I found a different and better way to help my sleep problem."
#colnames(SIMOA)[220] <- "Stopped - People close to me (e.g. family, friends) said they were concerned about me taking them."
#colnames(SIMOA)[237] <- "Would - People close to me (e.g. family, friends) said they were concerned about me taking them."
#colnames(SIMOA)[221] <- "Stopped - My prescriber wanted me to stop taking them."
#colnames(SIMOA)[238] <- "Would - My prescriber wanted me to stop taking them."
#colnames(SIMOA)[222] <- "Stopped - My pharmacist wanted me to stop taking them."
#colnames(SIMOA)[239] <- "Would - My pharmacist wanted me to stop taking them."
#colnames(SIMOA)[223] <- "Stopped - They caused problems with my other medications."
#colnames(SIMOA)[240] <- "Would - They caused problems with my other medications."
#colnames(SIMOA)[224] <- "Stopped - I developed a dependence problem with them."
#colnames(SIMOA)[241] <- "Would - I developed a dependence problem with them."
#colnames(SIMOA)[225] <- "Stopped - I learned a safe and effective way to stop them."
#colnames(SIMOA)[242] <- "Would - I learned a safe and effective way to stop them."
#colnames(SIMOA)[226] <- "Stopped - They cost too much."
#colnames(SIMOA)[243] <- "Would - They cost too much."
#colnames(SIMOA)[19] <- "OSSS-3_score"

################################################################################
################################################################################
## Here is the code for finding the average age of the people who completed the 
## OSSS-3 measure and also indicated their age and could identify the BZRA they
## use - this also includes the sex and gender breakdown

SIMOA_OSSS_3 <- SIMOA %>%
  filter(!is.na(`OSSS-3_score`) & 
           !is.na(`Which of the listed prescription sleeping pills have you taken 'regularly' in the past two (2) years?`) &
           `Which of the listed prescription sleeping pills have you taken 'regularly' in the past two (2) years?` != "" &
           !is.na(Alcohol) & 
           Alcohol != "")

# Calculate the average age and standard deviation of age
OSSS_3Avg_age <- mean(SIMOA_OSSS_3$`What is your age?`, na.rm = TRUE)
OSSS_3Sd_age <- sd(SIMOA_OSSS_3$`What is your age?`, na.rm = TRUE)

# Count the number of people used for the calculation
OSSS_3_num_people <- nrow(SIMOA_OSSS_3)

OSSS_3_Sex <- SIMOA_OSSS_3 %>%
  group_by(`What is your sex?`) %>%
  summarise(Count = n(), 
            Avg_Age = mean(`What is your age?`, na.rm = TRUE), 
            Sd_Age = sd(`What is your age?`, na.rm = TRUE))

# Print the results
cat("The average age is:", OSSS_3Avg_age, "\n")
cat("The standard deviation of age is:", OSSS_3Sd_age, "\n")
cat("Sex breakdown with counts and averages:\n")
print(OSSS_3_Sex)

OSSS_3_Gender <- SIMOA_OSSS_3 %>%
  group_by(`What is your gender identity?`) %>%
  summarise(Count = n(), 
            Avg_Age = mean(`What is your age?`, na.rm = TRUE), 
            Sd_Age = sd(`What is your age?`, na.rm = TRUE))

# Print the results
cat("The average age is:", OSSS_3Avg_age, "\n")
cat("The standard deviation of age is:", OSSS_3Sd_age, "\n")
cat("Sex breakdown with counts and averages:\n")
print(OSSS_3_Gender)


################################################################################
################################################################################
## Here is the code for finding the average age of the people who completed the 
## PHQ-2 measure and also indicated their age and could identify the BZRA they
## use - this also includes the sex and gender breakdown

SIMOA_PHQ_2 <- SIMOA %>%
  filter(!is.na(`OSSS-3_score`) & 
           !is.na(`Which of the listed prescription sleeping pills have you taken 'regularly' in the past two (2) years?`) &
           `Which of the listed prescription sleeping pills have you taken 'regularly' in the past two (2) years?` != "" &
           !is.na(Alcohol) & 
           Alcohol != "")

# Calculate the average age and standard deviation of age
OSSS_3Avg_age <- mean(SIMOA_OSSS_3$`What is your age?`, na.rm = TRUE)
OSSS_3Sd_age <- sd(SIMOA_OSSS_3$`What is your age?`, na.rm = TRUE)

# Count the number of people used for the calculation
OSSS_3_num_people <- nrow(SIMOA_OSSS_3)

# Print the results
cat("The average age is:", OSSS_3Avg_age, "\n")
cat("The standard deviation of age is:", OSSS_3Sd_age, "\n")
cat("The number of people used for the calculation is:", num_people, "\n")
