# INSTALLING PACKAGES
```r
install.packages("tidyverse")
# installed packages
1. tidyverse
2. here
3. skimr
4. janitor
5. dplyr
```

Help
```R
?print()
?functionname
```

Comment
```R
# Here's the example of comment 
```

assignment operator
```R
first_variable<- "Hi" 
```

Vector
In R, a vector is a one-dimensional array-like structure that contains homogeneous data elements of the same data type, such as numbers, characters, or logical values.
```R
x <- c(1, 2, 3, 4, 5)
```

To check installed packages
```R
# type it in the console
installed.packages()

# In priority base means already loaded 
# Recommanded means we need to load
```

Loading a package
```r
# in console
library("package_name")
```

updating  a package
```R
Update.packages()
```

![[Pasted image 20230508155725.png]]
TidyVerse is a collection of packages in R that are designed to help with data cleaning, wrangling, and visualization. It includes several packages, including:

1.  ggplot2: A package for creating graphics and data visualizations.
2.  dplyr: A package for data manipulation and transformation, including filtering, summarizing, and joining data frames.
3.  tidyr: A package for data tidying and reshaping, including functions for pivoting and spreading data.
4.  readr: A package for reading and writing data from various file formats.
5.  purrr: A package for functional programming, including mapping functions over data and working with lists.
6.  tibble: A package for creating and working with modern data frames.
7.  stringr: A package for string manipulation and pattern matching.
8.  forcats: A package for working with categorical data and factors.

loading  already existing data
```R
data("ToothGrowth")
# To view
View(ToothGrowth)
```

Functions (Dataframe)
```R
# To display top n rows of a dataset
head(datasetName)
# To print the column names of a dataset
colnames(datasetName)
# To print the column names with datatype of a dataset
str(datasetName)
```

Add new column into a dataset 
```R
mutate(datasetName,columnName)
```

# TRIBBLE
`tribble` is a function in the `tidyr` package of R that allows the creation of a data frame by specifying the values of each column as separate arguments. It provides a convenient way to create small, reproducible example datasets for data analysis and visualization.

You can create a tibble from existing data with the **as_tibble()** function. Indicate what data you’d like to use in the parentheses of the function. In this case, you will put the word “diamonds."
```R
as_tibble(diamonds)
```
![[Pasted image 20230508180332.png]]

# # Data-import basics

You can use the **data()** function to load these datasets in R

## The readr package
### **readr functions**

The goal of readr is to provide a fast and friendly way to read rectangular data. readr supports several read_ functions. Each function refers to a specific file format.

-   read_csv(): comma-separated values (.csv) files
    
-   read_tsv(): tab-separated values files
    
-   read_delim(): general delimited files
    
-   read_fwf(): fixed-width files
    
-   read_table(): tabular files where columns are separated by white-space
    
-   read_log(): web log files

### **Reading a .csv file with readr** 

The readr package comes with some sample files from built-in datasets that you can use for example code. To list the sample files, you can run the readr_example() function with no arguments. 

readr_example()

[1] "challenge.csv"     "epa78.txt"         "example.log"      

[4] "fwf-sample.txt"    "massey-rating.txt" "mtcars.csv"       

[7] "mtcars.csv.bz2"    "mtcars.csv.zip"

The “mtcars.csv” file refers to the _mtcars_ dataset that was mentioned earlier. Let’s use the **read_csv()** function to read the “mtcars.csv” file, as an example. In the parentheses, you need to supply the path to the file. In this case, it’s “readr_example(“mtcars.csv”). 

read_csv(readr_example("mtcars.csv"))

# SUMMARY OF DATA

skim_without_charts(penguins)
glimpse(penguins)

# PIPE
%>% is called the **forward pipe operator** in R. It provides a mechanism for chaining commands with a new forward-pipe operator, %>%. This operator will forward a value, or the result of an expression, into the next function call/expression.

```R
# It is similar to sql it retrives only the species column in the dataset
penguins %>%
  select(species)
```

The `%>%` symbol in R is called the "pipe" operator and is used in the context of data manipulation with the tidyverse package. It allows for more readable and concise code by allowing the output of one function to be used as the input of the next function.

For example, instead of writing nested functions like this:
```R
summary(filter(arrange(data, date), price > 100))
```

You can use the pipe operator like this:
```R
data %>%
  arrange(date) %>%
  filter(price > 100) %>%
  summary()
```

# ORGANIZE 

arrange() - sorts in ascending or descending 
```R
# ascending order
 penguins %>% arrange(bill_length_mm)
```
![[Pasted image 20230510085556.png]]
```R
# Decending order (add minus in fornt of column name)
penguins %>% arrange(-bill_length_mm)
```

Group_by()
```R
penguins %>% group_by(island)
```
![[Pasted image 20230510090640.png]]

```R
 penguins %>% group_by(island) %>% drop_na() %>% summarise(mean_bill_leangth=mean(bill_length_mm))
```
drop_na()  -> removes row containing null or NA values
summarise()  -> provides the summary
![[Pasted image 20230510090815.png]]

Filter()  -> Retrieves only the mentioned values
```R
penguins %>% filter(species=="Adelie")
```
![[Pasted image 20230510091231.png]]

# # Manually create a data frame

```R
# add these to console
id <- c(1:10)

name <- c("John Mendes", "Rob Stewart", "Rachel Abrahamson", "Christy Hickman", "Johnson Harper", "Candace Miller", "Carlson Landy", "Pansy Jordan", "Darius Berry", "Claudia Garcia")

job_title <- c("Professional", "Programmer", "Management", "Clerical", "Developer", "Programmer", "Management", "Clerical", "Developer", "Programmer")

# creating dataframe
employee <- data.frame(id, name, job_title)

```
![[Pasted image 20230510092719.png]]
# Transforming data

In the above diagram names are together to separate it use seperate()

```R
separate(employee,name,into = c("firstName","LastName"), sep = ' ')
```
![[Pasted image 20230510093137.png]]

unite() -> performs the reverse

# ggplot