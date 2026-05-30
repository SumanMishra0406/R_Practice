# %% [markdown] {"jupyter":{"outputs_hidden":false}}
# ![](https://www.r-project.org/Rlogo.png)
# 
# ____________________________________________________________________________________
# 
# ## Introduction
# 
# R is a programming language for statistical analysis and visualization. Using R, you can take raw data and understand the trends and patterns in it. You can also use R to create customizable, professional-looking visualizations.
# 
# This tutorial will help introduce you to the R programming language. I'm not going to assume any programming background for this tutorial. 
# 
# **To get started, click the blue "fork notebook" button in the upper right hand corner.**
# 
# ![The button to fork this notebook](https://image.ibb.co/kNKUZ5/Screenshot_from_2017_08_30_16_47_40.png)
# 
# > "**Forking**" something is making a copy of it that you can edit on your own without changing the original. 
# 
# ____________________________________________________________________________________
# 
# 
# ### Learning goals:
# 
# By the end of this tutorial, you will be able to do the following things. (Don't worry if you don't know what all these things are yet; we'll get there together!)
# 
# * [Be familiar with basic concepts: functions, variables, data types and vectors](https://www.kaggle.com/rtatman/getting-started-in-r-first-steps/)
# * [Load data into R](https://www.kaggle.com/rtatman/getting-started-in-r-load-data-into-r)
# * [Summerize your data](https://www.kaggle.com/rtatman/getting-started-in-r-summarize-data)
# * [Graph data and save your graphs](https://www.kaggle.com/rtatman/getting-started-in-r-graphing-data/)
# 
# ______
# 
# ### Your turn!
# 
# Throughout this tutorial, you'll have lots of opportunities to practice what you've just learned. Look for the phrase "your turn!" to find these exercises.

# %% [markdown] {"jupyter":{"outputs_hidden":false}}
# # First steps 
# 
# This section is designed to help you understand some basic vocabulary and concepts we'll use later on. If you already have some programming experience, you can probably skim this section.

# %% [markdown] {"jupyter":{"outputs_hidden":false}}
# ## Functions and Arguments

# %% [markdown] {"jupyter":{"outputs_hidden":false}}
# Let's get right into it and run our first line of code!

# %% [code] {"execution":{"iopub.status.busy":"2026-05-30T12:13:57.038915Z","iopub.execute_input":"2026-05-30T12:13:57.040978Z","iopub.status.idle":"2026-05-30T12:13:57.114099Z","shell.execute_reply":"2026-05-30T12:13:57.112252Z"},"jupyter":{"outputs_hidden":false}}
# This is a chunk with code. You'll notice that in code chunks, when I have something
# to say that I don't want R to treat as code, I'll put a # symbol in front of it.
# These non-code bits are called "comments", and they're helpful when you want to
# describe what's going on in your code. Use them often!

# To run a chunk, you can hit the blue "play" arrow to the left, or put your cursor inside
# the chunk and then hit CTRL + ENTER (CMD + ENTER on a Mac)

print("Welcome to R!")

# The output of the code will print below the chunk. You should see the text
# "Welcome to R!" print below ⇊⇊⇊ once this chunk has been run.

# %% [markdown] {"jupyter":{"outputs_hidden":false}}
# Congrats, you've run your first line of code! Now let's break it down a little bit. 
# ______
# There were two parts to the line of code you just ran:
# 
# ### print()
#    * This is what's called a "**function**". A function is like a verb; it tells the computer to do something. What that "something" is depends on the function. This function, print(), tell R to print out whatever was passed to it.
#    * For now, we're going to use functions that are already in R. Later on, however, we'll write our own!
# 
# ### "I'm coding in R!"
#    * This second part, inside the parentheses, is what is called an "**argument**". It's information that that function needs in order to run. In this case, we're giving the print() function a text string to print.
#    * One thing to watch out for is that certain functions require certain types of data as their arguments. Trying to give a function a type of data it can't handle is a common cause of bugs (a "bug" is a problem in your code).
#    
#    
# > You can think of a functions like verbs, and arugments nouns. Just like verbs, not all functions need arguments ("I smiled"), and some functions need more than one ("I put the flowers in the vase").
# 
# ______

# %% [code] {"execution":{"iopub.status.busy":"2026-05-30T12:13:57.117677Z","iopub.execute_input":"2026-05-30T12:13:57.156493Z","iopub.status.idle":"2026-05-30T12:13:57.176336Z","shell.execute_reply":"2026-05-30T12:13:57.173897Z"},"jupyter":{"outputs_hidden":false}}
# Your turn! Can you get "I'm coding in R" to print in the output?

print("I'm coding in R")

# HINT: Trying copying the code from the chunk above and modifying it. (You might
# be surprised how much of programming is copying other people's code and modifying
# it!)

# %% [markdown] {"jupyter":{"outputs_hidden":false}}
# > **How can you learn more about a function?** You can learn more about a function by checking the documentation that's been written for that funciton. You can do this by running the code ?functionName(), like in the following chunk.

# %% [code] {"execution":{"iopub.status.busy":"2026-05-30T12:13:57.181447Z","iopub.execute_input":"2026-05-30T12:13:57.183290Z","iopub.status.idle":"2026-05-30T12:13:57.342819Z","shell.execute_reply":"2026-05-30T12:13:57.339886Z"},"jupyter":{"outputs_hidden":false}}
# running this block will pull up the documentation page for the print() function
?print()

# %% [markdown] {"jupyter":{"outputs_hidden":false}}
# ## Variables

# %% [markdown] {"jupyter":{"outputs_hidden":false}}
# Ok, now you know how to run R code in a kernel, and how to run a function with an argument. Above, we used a string of text as an arguement. But it gets really boring & repetitive to type out everything you want every time. The joy of programming is that it can take care of the boring & repetitive stuff for you!
# 
# 
# Let's find out how to store data in a way that we can refer to it easily later.

# %% [code] {"execution":{"iopub.status.busy":"2026-05-30T12:13:57.345817Z","iopub.execute_input":"2026-05-30T12:13:57.347415Z","iopub.status.idle":"2026-05-30T12:13:57.412420Z","shell.execute_reply":"2026-05-30T12:13:57.369854Z"},"jupyter":{"outputs_hidden":false}}
# in R, you can store data in a variable by using either "=" or "<-". You can name a 
# variable anything you want as long as it's not already the name of something else.
# I find that a short phrase (without spaces) is generally best.

textToPrint <- "this is some text to print"

# if you give R the name of a variable, it will print whatever is in that variable

textToPrint

# note that capitalization does matter! This line will generate an error becuase 
# there is nothing called "texttoprint"

texttoprint

# %% [code] {"execution":{"iopub.status.busy":"2026-05-30T12:14:05.523442Z","iopub.execute_input":"2026-05-30T12:14:05.525091Z","iopub.status.idle":"2026-05-30T12:14:05.546501Z","shell.execute_reply":"2026-05-30T12:14:05.544028Z"},"jupyter":{"outputs_hidden":false}}
# Your turn! Create a variable named "aSentence" and store a sentence in it
aSentence <- "This is a sentence"

aSentence

# %% [markdown] {"jupyter":{"outputs_hidden":false}}
# Ok, so now we've got a little chunk of data that has a name. Now, we can use that name as an argument in a function. Let's try it out;

# %% [code] {"execution":{"iopub.status.busy":"2026-05-30T12:14:07.302940Z","iopub.execute_input":"2026-05-30T12:14:07.304597Z","iopub.status.idle":"2026-05-30T12:14:07.339412Z","shell.execute_reply":"2026-05-30T12:14:07.336997Z"},"jupyter":{"outputs_hidden":false}}
# our old friend print()
print(textToPrint)

# the nchar() function tells you the number of characters in a variable
nchar(textToPrint)

# the c() function concatenates (strings together) all its arguments
c(textToPrint, textToPrint, textToPrint)

# %% [code] {"execution":{"iopub.status.busy":"2026-05-30T12:14:09.027532Z","iopub.execute_input":"2026-05-30T12:14:09.029223Z","iopub.status.idle":"2026-05-30T12:14:09.059722Z","shell.execute_reply":"2026-05-30T12:14:09.057268Z"},"jupyter":{"outputs_hidden":false}}
# Your turn! Try the following three exercises on your own. Remember: it's prefectly 
# ok to copy code and then modify it.

# print your variable "aSentence" you made above
print(aSentence)
# find out the number of characters in "aSentence"
nchar(aSentence)
# concatenate the "textToPrint" and "aSentence" variables
c(aSentence,aSentence,aSentence)

# %% [markdown] {"jupyter":{"outputs_hidden":false}}
#  ## Data Types

# %% [markdown] {"jupyter":{"outputs_hidden":false}}
# So far, all the data that we've looked at has been text strings. There are, however, lots of other types of data in R. (You may remember from our discussion of functions and arguments that using an argument of the wrong data type is a common source of errors.) 
# 
# Let's look at some of the common data types you'll use in R.

# %% [code] {"execution":{"iopub.status.busy":"2026-05-30T12:14:10.862423Z","iopub.execute_input":"2026-05-30T12:14:10.864169Z","iopub.status.idle":"2026-05-30T12:14:10.892381Z","shell.execute_reply":"2026-05-30T12:14:10.886168Z"},"jupyter":{"outputs_hidden":false}}
# What we've seen so far are characters. This is the type of data you'll use for text
anExampleOfCharacters <- "someText"

# we can check the data type of a variable using the function str() (like "structure")
str(anExampleOfCharacters)
# we can tell this is a character because it's structure is "chr"

# %% [code] {"execution":{"iopub.status.busy":"2026-05-30T12:14:12.594977Z","iopub.execute_input":"2026-05-30T12:14:12.596663Z","iopub.status.idle":"2026-05-30T12:14:12.617442Z","shell.execute_reply":"2026-05-30T12:14:12.615028Z"},"jupyter":{"outputs_hidden":false}}
# Your turn! 
# Check the data type of the "aSentence" variable you made above.
str(aSentence)

# %% [markdown] {"jupyter":{"outputs_hidden":false}}
# But not all data in the world is text data. There are also a lot of numbers. Unlike text data, you can just give numbers directly to R. (In fact, if you put quotes around a number, R will store it as a character & you won't be able to do math with it!)

# %% [code] {"execution":{"iopub.status.busy":"2026-05-30T12:14:25.069970Z","iopub.execute_input":"2026-05-30T12:14:25.071574Z","iopub.status.idle":"2026-05-30T12:14:25.136110Z","shell.execute_reply":"2026-05-30T12:14:25.133588Z"},"jupyter":{"outputs_hidden":false}}
# let's create some numeric variables
hoursPerDay <- 24
daysPerWeek <- 7

# we can check to make sure that these actually are numeric
str(hoursPerDay)
class(daysPerWeek)

# since this is numeric data, we can do math with it! 
# "*" is the symbol for multiplication
hoursPerWeek <- hoursPerDay * daysPerWeek
hoursPerWeek

# %% [code] {"execution":{"iopub.status.busy":"2026-05-30T12:14:30.245053Z","iopub.execute_input":"2026-05-30T12:14:30.246698Z","iopub.status.idle":"2026-05-30T12:14:30.266285Z","shell.execute_reply":"2026-05-30T12:14:30.264343Z"},"jupyter":{"outputs_hidden":false}}
# Your turn!

# Create a numeric variable "minutesPerHour" and use it to calcuate a new variable called
# "minutesPerWeek" that has the number of minutes per week in it
minutesPerHour <- 60*60
minutesPerWeek <- hoursPerWeek*minutesPerHour
print(minutesPerWeek)

# %% [code] {"execution":{"iopub.status.busy":"2026-05-30T12:14:31.292160Z","iopub.execute_input":"2026-05-30T12:14:31.293864Z","iopub.status.idle":"2026-05-30T12:14:31.337595Z","shell.execute_reply":"2026-05-30T12:14:31.327043Z"},"jupyter":{"outputs_hidden":false}}
# Important! Just becuase something is a *number* doesn't mean R thinks it's numeric!

a <- 5
b <- "6"

# this will get you the error "non-numeric argument to binary operator", becuase b isn't
# numeric, even though it's a number!
a * b

# %% [markdown] {"jupyter":{"outputs_hidden":false}}
# Don't be scared of error messages! Everyone gets error messages, and they're there to help you. A good first step when you get an error message you don't understand is to search Google for the text of your error message.

# %% [code] {"execution":{"iopub.status.busy":"2026-05-30T12:14:32.563282Z","iopub.execute_input":"2026-05-30T12:14:32.564953Z","iopub.status.idle":"2026-05-30T12:14:32.589841Z","shell.execute_reply":"2026-05-30T12:14:32.587975Z"},"jupyter":{"outputs_hidden":false}}
# You can change character data to numeric data using the as.numeric() function.
# This will let you do math with it again. :)
a * as.numeric(b)

# check out the stucture: note that b changes from "chr" to "num
str(b)
str(as.numeric(b))

# to fix b to be a number permentantly
# b <- as.numeric(b)

# %% [code] {"execution":{"iopub.status.busy":"2026-05-30T12:14:34.278000Z","iopub.execute_input":"2026-05-30T12:14:34.279661Z","iopub.status.idle":"2026-05-30T12:14:34.305206Z","shell.execute_reply":"2026-05-30T12:14:34.303373Z"},"jupyter":{"outputs_hidden":false}}
# Your turn!

# What happens when you try to use the as.numeric() function on text that isn't data?
# Trying running the as.numeric() function on your "aSentence" variable from earlier.
as.numeric(aSentence)

# Search Google (or your favorite search engine) for more information on the error message
# you get.

# %% [markdown] {"jupyter":{"outputs_hidden":false}}
# So far we've learned about two data types: character and numeric. But there's a third common data type you'll encounter a lot in R: logical or boolean (pronounced BOO-lee-un) data. Booleans can only take two values, TRUE and FALSE.

# %% [code] {"execution":{"iopub.status.busy":"2026-05-30T12:14:41.610988Z","iopub.execute_input":"2026-05-30T12:14:41.612798Z","iopub.status.idle":"2026-05-30T12:14:41.634501Z","shell.execute_reply":"2026-05-30T12:14:41.632651Z"},"jupyter":{"outputs_hidden":false}}
# You'll get a boolean back if you ask R "are these two things the same?" using "=="
"a" == "b"
1 == 1

# %% [code] {"execution":{"iopub.status.busy":"2026-05-30T12:14:54.517911Z","iopub.execute_input":"2026-05-30T12:14:54.519713Z","iopub.status.idle":"2026-05-30T12:14:54.538146Z","shell.execute_reply":"2026-05-30T12:14:54.536172Z"},"jupyter":{"outputs_hidden":false}}
# Your turn!

# First, take a guess: will 6 == "6" return TRUE or FALSE?
# Then test your prediction. Are you surprised by the outcome? What does this tell you
# about datatypes in R?
6 == "6"

# %% [markdown] {"jupyter":{"outputs_hidden":false}}
# So, to review, the data types we've seen so far are:
# * **Character**. This is usually used for text data, and surrounded by "quotation marks"
# * **Numeric**. This is the data type used for numbers. If you accidentally say numeric data is a character, you won't be able to do any math with it.
# * **Logical**. This data type only has two values, TRUE and FALSE.
# 
# There other datatypes in R, but these are the ones you'll probably see most often.

# %% [markdown] {"jupyter":{"outputs_hidden":false}}
# ## Vectors

# %% [markdown] {"jupyter":{"outputs_hidden":false}}
# Ok, this is the last part of the introduction. Promise! The next step is to start in on our data analysis.
# 
# First, however, we need to understand one of the most important parts of using R: vectorization. 
# 
# > In programming, a **vector** is list of data that is all of the same data type.
# 
# R is very efficient at manipulating vectors, and you'll want to use them as often as possible. You can make a vector using the c() (for "concatenate") function we learned above.

# %% [code] {"execution":{"iopub.status.busy":"2026-05-30T12:16:09.932315Z","iopub.execute_input":"2026-05-30T12:16:09.938130Z","iopub.status.idle":"2026-05-30T12:16:09.971016Z","shell.execute_reply":"2026-05-30T12:16:09.969190Z"},"jupyter":{"outputs_hidden":false}}
# let's make a vector!
listOfNumbers <- c(1,5,91,42.8,100008.41)
listOfNumbers

# becuase this is a numeric vector, we can do math on it! When you do math to a vector,
# it happens to every number in the vector. (If you're familiar with matrix 
# mutiplication, it's the same thing as multiplying a 1x1 matrix by a 1xN matrix.)

# multiply every number in the vector by 5
5 * listOfNumbers

# add one to every number in the vector
listOfNumbers + 1

# %% [code] {"execution":{"iopub.status.busy":"2026-05-30T12:16:22.992445Z","iopub.execute_input":"2026-05-30T12:16:22.994075Z","iopub.status.idle":"2026-05-30T12:16:23.013061Z","shell.execute_reply":"2026-05-30T12:16:23.011077Z"},"jupyter":{"outputs_hidden":false}}
# Your turn!

# divide every number in the vector by 2. In R, you do division using the / symbol.
listOfNumbers / 2

# %% [markdown] {"jupyter":{"outputs_hidden":false}}
# One thing you'll often want to do with vectors (especially very, very long ones) is to look at only part of a vector. You can look inside a vector using square brackets ([]). The number inside the square brackets tells R what **index** to look at. In R, indexes start at one.
# 
# > You can think of an **index** like the street number on a house and a vector like a street. If you ask for just the vector, R will give you you the whole "street" because it doesn't known which house you want.

# %% [code] {"execution":{"iopub.status.busy":"2026-05-30T12:16:29.430675Z","iopub.execute_input":"2026-05-30T12:16:29.432888Z","iopub.status.idle":"2026-05-30T12:16:29.455962Z","shell.execute_reply":"2026-05-30T12:16:29.453646Z"},"jupyter":{"outputs_hidden":false}}
# get the first item from "listOfNumbers"
listOfNumbers[1]

# %% [code] {"execution":{"iopub.status.busy":"2026-05-30T12:16:58.085074Z","iopub.execute_input":"2026-05-30T12:16:58.086780Z","iopub.status.idle":"2026-05-30T12:16:58.104182Z","shell.execute_reply":"2026-05-30T12:16:58.102327Z"},"jupyter":{"outputs_hidden":false}}
# Your turn!

# get the third item from "listOfNumbers"
listOfNumbers[3]
# object[index]
# function(argument)

# %% [markdown] {"jupyter":{"outputs_hidden":false}}
# There's a lot more to learn about R, but this is enough to get you started for now. Let's get into analyzing some data!

# %% [markdown] {"jupyter":{"outputs_hidden":false}}
# ## Next step: [Load data into R](https://www.kaggle.com/rtatman/getting-started-in-r-load-data-into-r)

# %% [markdown] {"jupyter":{"outputs_hidden":false}}
# 