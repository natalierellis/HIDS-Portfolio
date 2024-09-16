Python Fundamentals:
#see variable type
type(x) instead of class(x) as in R

#create variable; new variable MUST be first
savings = 100 (use equal sign instead of arrow in R)

#boolean is lowercase in python
is_good = True

#in python, indexing starts at 0
# when slicing, the end index is NOT included
my_list[start:end]
downstairs = areas[:6] #includes first six elements
upstairs = areas[-4:] #includes last 4 elements
house[4][1] #subsetting second element of 5th bracket in list 

#accessing tuple
tup[0] for first
#how to change an element in a list
areas[4] = "chill zone" 

#adding to a list
areas_1 = areas + ["poolhouse", 24.5]
#you need to specify print() for it to actually print

#deleting element
del areas[3] -> automatically deletes element of this list, so if you change wrong thing, will need to run original list again 

#when creating copying of list, must use this so original list is not edited during manipulation (unlike R, creating a copy under new name creates completly new variable that does not affect original variable when manipulated)
areas_copy = list(areas)

#switching between datatypes,
int(), str(), bool(), float()

#comparing np.arrays
print(np.logical_or(my_house > 18.5, my_house < 10))

#everything in python is an object and each data type has specific functions that are not shared by other data types - these are called methods 
help(str) ex to find these methods
ex: if string is place and you want to capitalize it -> place.upper() not upper(place)
so its object.method(whatyourinterestedin)

#add another object to list
list.append(new)
#removes first element of list
list.remove()
#reverses order of list
list.reverse
#finds index of obj in list
list.index(obj)

#new packages
import package

#or new function in package
from numpy import function
using: function() not package.function()
	
#ex: math package -> math.pi = pi, so you can calculate cirumference with math.pi*2*r

#common data science package is numpy
#create numpy array that you can vectorize
np.array(list) 
conversion = np.array([0.0254, 0.453592, 1]) - gotta use brackets in parantheses

#2d numpy arrays are a list of lists 
#use array_name.shape to find dimensions

#indexing again
# Print out the 50th row of np_baseball
print(np_baseball[49])
# Select the entire second column of np_baseball: np_weight_lb
np_weight_lb = np_baseball[ :,1]
# Print out height of 124th player
print(np_baseball[123,0])
#select the last element
np_baseball[-1]

#stats:
np.mean()
np.median()
# Print out the standard deviation on height
stddev = np.std(np_baseball[:,0])
# Print out correlation between first and second column
corr = np.corrcoef(np_baseball[:,0], np_baseball[:,1])

#visualizations
# Print the last item from year and pop
print(year[-1])
print(pop[-1])
# Import matplotlib.pyplot as plt
import matplotlib.pyplot as plt
# Make a line plot: year on the x-axis, pop on the y-axis
plt.plot(year, pop)
#scatter
plt.scatter(x,y)
# Display the plot with plt.show()
plt.show()
#convert x-axis to log scale
plt.xscale('log')
#hist
plt.hist(x)
# Add axis labels
plt.xlabel('xlab')
plt.ylabel('ylab')
# Add title
plt.title('title')
# Definition of tick_val(what the actual values are)and tick_lab(how you want them represented/written on graph)
tick_val = [1000, 10000, 100000]
tick_lab = ['1k', '10k', '100k']
# Adapt the ticks on the x-axis
plt.xticks(tick_val, tick_lab)
#size of scatter marks
plt.scatter(gdp_cap, life_exp, s = np_pop)
# Specify color and opacity (alpha) inside plt.scatter()
plt.scatter(x = gdp_cap, y = life_exp, s = np.array(pop) * 2, c = col, alpha = 0.8)
# Add grid lines
plt.grid(True)

#dictionaries
#create dict
europe = {'spain':'madrid', 'france':'paris', 'germany':'berlin', 'norway':'oslo' }
# Print out the keys in dict
print(dict.keys())
# Print out value that belongs to key 'norway'
print(dict['norway'])
# Add italy to europe/ change italy value
europe['italy'] = 'rome'
# del australia
del(europe['australia'])

# Dictionary of dictionaries
europe = { 'spain': { 'capital':'madrid', 'population':46.77 },
           'france': { 'capital':'paris', 'population':66.03 },
           'germany': { 'capital':'berlin', 'population':80.62 },
           'norway': { 'capital':'oslo', 'population':5.084 } }
# Print out the capital of France
print(europe['france']['capital'])
# Create sub-dictionary data
data = {'capital':'rome', 'population':59.83}
# Add data to europe under key 'italy'
europe['italy'] = data

#tabular data
#numpy array only works with one data type
#need to use pandas
# Pre-defined lists
names = ['United States', 'Australia', 'Japan', 'India', 'Russia', 'Morocco', 'Egypt']
dr =  [True, False, False, False, True, True, True]
cpc = [809, 731, 588, 18, 200, 70, 45]
# Import pandas as pd
import pandas as pd
# Create dictionary my_dict with three key:value pairs: my_dict
my_dict = {'country':names, 'drives_right':dr, 'cars_per_cap':cpc }
# Build a DataFrame cars from my_dict: cars
cars = pd.DataFrame(my_dict)
# Definition of row_labels
row_labels = ['US', 'AUS', 'JPN', 'IN', 'RU', 'MOR', 'EG']
# Specify row labels of cars
cars.index = row_labels
# Import the cars.csv data: cars
cars = pd.read_csv('cars.csv')
# Fix import by including index_col
cars = pd.read_csv('cars.csv', index_col = 0)
# Print out country column as Pandas DataFrame
print(cars[['country']])
# Print out DataFrame with country and drives_right columns
print(cars[['country', 'drives_right']])
# Print out observations for Australia and Egypt
cars.loc[['AUS', 'EG']]
# Print sub-DataFrame
print(cars.loc[['RU', 'MOR'], ['country', 'drives_right']])
#print two columns and all rows 
print(cars.loc[:,['cars_per_cap', 'drives_right']])
# filtering: observations with cars_per_cap between 100 and 500 (this seems unneccesary)
cpc = cars['cars_per_cap']
between = np.logical_and(cpc > 100, cpc < 500)
medium = cars[between]
#add new column based on another column
cars["COUNTRY"] = cars["country"].apply(str.upper)

#if else statements python
# if-elif-else construct for area
if area > 15 :
    print("big place!")
elif  10 < area <= 15:
    print("medium size, nice!")
else :
    print("pretty small.")

#while loop
offset = 8
# Code the while loop
while offset != 0 :
    print("correcting...")
    offset = offset - 1
    print(offset)
#for loop
# areas list
areas = [11.25, 18.0, 20.0, 10.75, 9.50]
# Code the for loop
for blank in areas:
    print(blank)
#for loop with indexing
# Code the for loop
for index, area in enumerate(areas) :
    print("room " + str(index+1) + ": " + str(area))
#for loop in dictionary
# Iterate over europe
for key, value in europe.items():
    print("the capital of " + key + " is " + value)
#for loop for numpy array
for x in np.nditer(np_baseball) :
    print(x)
#iterating over rows in pandas
for lab, row in cars.iterrows():
    print(lab)
    print(row)
#random number
# Set the seed
np.random.seed(123)
# Generate and print random float
print(np.random.rand())
print(np.random.randint(1,7))

#writing functions
def shout(word):
    shout_word = word + '!!!'
    return(shout_word)

#lambda functions - quickier ways to write functions
echo_word = (lambda word1, echo: word1*echo)
#lamba with two args
# Use reduce() to apply a lambda function over stark: result
result = reduce(lambda item1, item2: item1 + item2, stark)

#for loop is a type of iterator 
for person in flash:
    print(person)
#is the same as
superhero = iter(flash)
print(next(superhero))

# Loop over range(3) and print the values
for i in range(3):
    print(i)
#is the same as:
# Create an iterator for range(10 ** 100): googol
googol = iter(range(10 ** 100))
print(next(googol))

#count numbers from x to y
range(x,y)

#really complicated use of iterators:
# Define count_entries()
def count_entries(csv_file, c_size, colname):
    """Return a dictionary with counts of
    occurrences as value for each key."""
    
    # Initialize an empty dictionary: counts_dict
    counts_dict = {}

    # Iterate over the file chunk by chunk
    for chunk in pd.read_csv(csv_file, chunksize = c_size):

        # Iterate over the column in DataFrame
        for entry in chunk[colname]:
            if entry in counts_dict.keys():
                counts_dict[entry] += 1
            else:
                counts_dict[entry] = 1

    # Return counts_dict
    return counts_dict

# Call count_entries(): result_counts
result_counts = count_entries('tweets.csv', 10, 'lang')

# Print result_counts
print(result_counts)

#list comprehension -> easier for loop 
[output expression for iterator variable in iterable]
#list comprehension example with squaring:
squares = [i**2 for i in range(0,10)]
#nested ones dont make sense
#add a conditional here
new_fellowship = [member for member in fellowship if len(member) >= 7]
# if-else conditional
new_fellowship = [member if len(member) >= 7 else '' for member in fellowship]
# Create dict comprehension: new_fellowship
new_fellowship = {member: len(member) for member in fellowship}
#generator is same as list comprehrension but returns generator object, uses () instead of []	#generator example
# Create a generator object: lengths
lengths = (len(person) for person in lannister)
# Iterate over and print the values in lengths
for value in lengths:
    print(value)	
#generator function:
# Create a list of strings
lannister = ['cersei', 'jaime', 'tywin', 'tyrion', 'joffrey']
# Define generator function get_lengths
def get_lengths(input_list):
    """Generator function that yields the
    length of the strings in input_list."""
    # Yield the length of a string
    for person in input_list:
        yield len(person)
# Print the values generated by get_lengths()
for value in get_lengths(lannister):
    print(value)
